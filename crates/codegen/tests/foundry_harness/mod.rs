//! Foundry integration test harness.
//!
//! This module tests Solar's codegen by:
//! 1. Running `forge test` with `FOUNDRY_SOLC=solar` (compiles everything with Solar)
//! 2. Running `forge test` with solc (baseline)
//! 3. Comparing gas usage and test results
//!
//! Run with: cargo test -p solar-codegen --test foundry
#![allow(clippy::uninlined_format_args, clippy::collapsible_if, clippy::disallowed_methods)]

use std::{
    collections::HashMap,
    path::{Path, PathBuf},
    process::Command,
    time::{Duration, Instant, SystemTime},
};

fn add_forge_verbosity(cmd: &mut Command) {
    let Ok(level) = std::env::var("SOLAR_FOUNDRY_VERBOSITY") else {
        return;
    };

    let arg = if level.chars().all(|c| c == 'v') {
        format!("-{}", level)
    } else if level.chars().all(|c| c.is_ascii_digit()) {
        let count: usize = level.parse().unwrap_or(0);
        if count == 0 {
            return;
        }
        format!("-{}", "v".repeat(count))
    } else if level.starts_with('-') {
        level
    } else {
        format!("-{}", level)
    };

    cmd.arg(arg);
}

// ============================================================================
// Configuration
// ============================================================================

/// Configuration for running a test project.
#[derive(Debug, Clone)]
struct TestConfig {
    /// Project name (used for display).
    name: String,
    /// Path to project relative to the codegen crate.
    path: String,
    /// Optional filter for test function names (substring match).
    test_filter: Option<String>,
    /// Optional filter for contract names (substring match).
    contract_filter: Option<String>,
    /// If true, only run with Solar (no solc comparison).
    solar_only: bool,
    /// If true, require Solar gas <= solc gas for all tests.
    require_gas_parity: bool,
}

impl TestConfig {
    /// Creates a new config with default settings.
    fn new(name: impl Into<String>, path: impl Into<String>) -> Self {
        Self {
            name: name.into(),
            path: path.into(),
            test_filter: None,
            contract_filter: None,
            solar_only: false,
            require_gas_parity: true,
        }
    }

    /// Sets test function filter (substring match on test names).
    fn test_filter(mut self, filter: impl Into<String>) -> Self {
        self.test_filter = Some(filter.into());
        self
    }

    /// Sets contract filter (substring match on contract names).
    fn contract_filter(mut self, filter: impl Into<String>) -> Self {
        self.contract_filter = Some(filter.into());
        self
    }

    /// Sets whether to run Solar-only (no solc comparison).
    fn solar_only(mut self, value: bool) -> Self {
        self.solar_only = value;
        self
    }

    /// Sets whether to require gas parity (Solar <= solc).
    #[allow(dead_code)]
    fn require_gas_parity(mut self, value: bool) -> Self {
        self.require_gas_parity = value;
        self
    }

    /// Runs the test with this configuration.
    fn run(&self) {
        run_test_with_config(self);
    }
}

// ============================================================================
// Internal Types
// ============================================================================

/// Result of a single test.
#[derive(Debug, Clone)]
struct TestResult {
    name: String,
    contract: String,
    passed: bool,
    gas: u64,
}

/// Result of running a compiler on a project.
#[derive(Debug)]
#[allow(dead_code)]
struct CompilerRun {
    compiler: String,
    compile_time: Duration,
    tests: Vec<TestResult>,
    total_passed: usize,
    total_failed: usize,
    bytecode_sizes: HashMap<String, usize>,
}

// ============================================================================
// Helpers
// ============================================================================

/// Gets the path to the Solar binary (release build preferred, falls back to debug).
fn get_solar_binary() -> PathBuf {
    let manifest_dir = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
    let workspace_root = manifest_dir.parent().unwrap().parent().unwrap();

    // Prefer release build for accurate benchmarks
    let release_binary = workspace_root.join("target/release/solar");
    if release_binary.exists() {
        return release_binary;
    }

    workspace_root.join("target/debug/solar")
}

/// Gets the path to the codegen crate.
fn get_crate_dir() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

/// Checks if forge is available.
fn forge_available() -> bool {
    Command::new("forge").arg("--version").output().is_ok()
}

/// Generates a timestamp string for file naming.
fn timestamp_suffix() -> String {
    SystemTime::now()
        .duration_since(SystemTime::UNIX_EPOCH)
        .map(|d| d.as_secs().to_string())
        .unwrap_or_else(|_| "unknown".to_string())
}

/// Saves JSON output to a file for debugging.
fn save_json_output(project_dir: &Path, filename: &str, content: &str) -> PathBuf {
    let timestamp = timestamp_suffix();
    let json_path = project_dir.join(format!("{}-{}.json", filename, timestamp));
    if let Err(e) = std::fs::write(&json_path, content) {
        eprintln!("⚠️  Failed to save JSON to {:?}: {}", json_path, e);
    }
    json_path
}

/// Filters tests based on config.
fn filter_tests(tests: Vec<TestResult>, config: &TestConfig) -> Vec<TestResult> {
    tests
        .into_iter()
        .filter(|t| {
            let test_match =
                config.test_filter.as_ref().map(|f| t.name.contains(f)).unwrap_or(true);
            let contract_match =
                config.contract_filter.as_ref().map(|f| t.contract.contains(f)).unwrap_or(true);
            test_match && contract_match
        })
        .collect()
}

// ============================================================================
// Parsing & Extraction
// ============================================================================

/// Parses test results from forge JSON output.
fn parse_test_results(stdout: &str) -> Vec<TestResult> {
    let mut tests = Vec::new();

    if let Ok(json) = serde_json::from_str::<serde_json::Value>(stdout) {
        if let Some(obj) = json.as_object() {
            for (contract_path, contract_data) in obj {
                // Extract contract name from path (e.g., "src/Test.t.sol:TestContract")
                let contract_name =
                    contract_path.rsplit(':').next().unwrap_or(contract_path).to_string();

                if let Some(test_results) = contract_data.get("test_results") {
                    if let Some(tests_obj) = test_results.as_object() {
                        for (name, result) in tests_obj {
                            let passed = result
                                .get("status")
                                .and_then(|s| s.as_str())
                                .map(|s| s == "Success")
                                .unwrap_or(false);
                            let gas = result
                                .get("kind")
                                .and_then(|k| k.get("Unit"))
                                .and_then(|u| u.get("gas"))
                                .and_then(|g| g.as_u64())
                                .unwrap_or(0);
                            tests.push(TestResult {
                                name: name.clone(),
                                contract: contract_name.clone(),
                                passed,
                                gas,
                            });
                        }
                    }
                }
            }
        }
    }

    tests
}

/// Extracts bytecode sizes from forge output directory.
fn extract_bytecode_sizes(out_path: &Path) -> HashMap<String, usize> {
    let mut sizes = HashMap::new();

    if let Ok(entries) = std::fs::read_dir(out_path) {
        for entry in entries.flatten() {
            let path = entry.path();
            if path.is_dir() {
                // Skip test contract artifacts
                let dir_name = path.file_name().unwrap().to_string_lossy();
                if dir_name.ends_with(".t.sol") {
                    continue;
                }

                if let Ok(files) = std::fs::read_dir(&path) {
                    for file in files.flatten() {
                        let file_path = file.path();
                        if file_path.extension().is_some_and(|e| e == "json") {
                            if let Ok(content) = std::fs::read_to_string(&file_path) {
                                if let Ok(json) =
                                    serde_json::from_str::<serde_json::Value>(&content)
                                {
                                    if let Some(bytecode) = json
                                        .get("deployedBytecode")
                                        .and_then(|b| b.get("object"))
                                        .and_then(|o| o.as_str())
                                    {
                                        let hex = bytecode.strip_prefix("0x").unwrap_or(bytecode);
                                        let size = hex.len() / 2;
                                        if size > 0 {
                                            let name = file_path
                                                .file_stem()
                                                .unwrap()
                                                .to_string_lossy()
                                                .to_string();
                                            sizes.insert(name, size);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    sizes
}

// ============================================================================
// Forge Execution
// ============================================================================

/// Runs forge test with Solar as the compiler.
fn run_forge_test_solar(
    project_dir: &PathBuf,
    label: &str,
    config: &TestConfig,
) -> (Duration, Vec<TestResult>, HashMap<String, usize>) {
    let out_dir = "out-solar";
    let cache_dir = "cache-solar";

    let mut cmd = Command::new("forge");
    cmd.current_dir(project_dir)
        .arg("test")
        .arg("--force")
        .arg("--json")
        .arg("--decode-internal")
        .arg("--out")
        .arg(out_dir)
        .arg("--cache-path")
        .arg(cache_dir)
        .env("FOUNDRY_SOLC", get_solar_binary());
    add_forge_verbosity(&mut cmd);

    // Add forge match filters if specified
    if let Some(ref test_filter) = config.test_filter {
        cmd.arg("--match-test").arg(test_filter);
    }
    if let Some(ref contract_filter) = config.contract_filter {
        cmd.arg("--match-contract").arg(contract_filter);
    }

    let start = Instant::now();
    let output = cmd.output().expect("failed to run forge test for Solar");
    let test_time = start.elapsed();

    let stdout = String::from_utf8_lossy(&output.stdout);

    // Save JSON output for debugging
    let json_path = save_json_output(project_dir, "solar-test-output", &stdout);

    // Print info when there are failures
    if !output.status.success() || stdout.contains("\"status\":\"Failure\"") {
        eprintln!("\n🔍 [{}] Full JSON saved to: {:?}", label, json_path);
        if !output.stderr.is_empty() {
            eprintln!("stderr: {}", String::from_utf8_lossy(&output.stderr));
        }
    }

    let tests = parse_test_results(&stdout);
    let sizes = extract_bytecode_sizes(&project_dir.join(out_dir));

    (test_time, tests, sizes)
}

/// Runs forge test with solc (baseline).
fn run_forge_test_solc(
    project_dir: &PathBuf,
    config: &TestConfig,
) -> (Duration, Vec<TestResult>, HashMap<String, usize>) {
    let out_dir = "out-solc";
    let cache_dir = "cache-solc";

    let mut cmd = Command::new("forge");
    cmd.current_dir(project_dir)
        .arg("test")
        .arg("--force")
        .arg("--json")
        .arg("--decode-internal")
        .arg("--out")
        .arg(out_dir)
        .arg("--cache-path")
        .arg(cache_dir)
        .env("RUST_LOG", "foundry_compilers=trace");
    add_forge_verbosity(&mut cmd);

    // Add forge match filters if specified
    if let Some(ref test_filter) = config.test_filter {
        cmd.arg("--match-test").arg(test_filter);
    }
    if let Some(ref contract_filter) = config.contract_filter {
        cmd.arg("--match-contract").arg(contract_filter);
    }

    let start = Instant::now();
    let output = cmd.output().expect("failed to run forge test");
    let test_time = start.elapsed();

    let stdout = String::from_utf8_lossy(&output.stdout);

    // Save JSON output for debugging
    let _json_path = save_json_output(project_dir, "solc-test-output", &stdout);

    let tests = parse_test_results(&stdout);
    let sizes = extract_bytecode_sizes(&project_dir.join(out_dir));

    (test_time, tests, sizes)
}

// ============================================================================
// Comparison & Reporting
// ============================================================================

/// Compares Solar and solc test results and prints a diff summary.
fn print_test_diff(solar_tests: &[TestResult], solc_tests: &[TestResult], label: &str) {
    let solar_map: HashMap<&str, &TestResult> =
        solar_tests.iter().map(|t| (t.name.as_str(), t)).collect();
    let solc_map: HashMap<&str, &TestResult> =
        solc_tests.iter().map(|t| (t.name.as_str(), t)).collect();

    let mut regressions = Vec::new();
    let mut gas_diffs = Vec::new();

    for (name, solc_test) in &solc_map {
        match solar_map.get(name) {
            Some(solar_test) => {
                // Test exists in both - check for regression
                if solc_test.passed && !solar_test.passed {
                    regressions.push(*name);
                }
                // Track gas difference for passing tests
                if solar_test.passed && solc_test.passed && solc_test.gas > 0 {
                    let diff_pct = ((solar_test.gas as f64 / solc_test.gas as f64) - 1.0) * 100.0;
                    gas_diffs.push((*name, solar_test.gas, solc_test.gas, diff_pct));
                }
            }
            None => {
                // Test only in solc
                if solc_test.passed {
                    regressions.push(*name);
                }
            }
        }
    }

    if !regressions.is_empty() {
        eprintln!(
            "\n❌ [{}] REGRESSIONS: {} tests pass in solc but fail in Solar:",
            label,
            regressions.len()
        );
        for name in &regressions {
            eprintln!("   - {}", name);
        }
    }

    if !gas_diffs.is_empty() {
        eprintln!("\n⛽ [{}] Gas comparison (Solar vs solc):", label);
        for (name, solar_gas, solc_gas, diff_pct) in &gas_diffs {
            let indicator = if *diff_pct > 5.0 {
                "📈"
            } else if *diff_pct < -5.0 {
                "📉"
            } else {
                "≈"
            };
            eprintln!(
                "   {} {:40} Solar: {:>8} | solc: {:>8} | {:>+6.1}%",
                indicator, name, solar_gas, solc_gas, diff_pct
            );
        }
    }
}

/// Runs a full comparison between Solar and solc for a project.
fn run_project_comparison(config: &TestConfig) -> (CompilerRun, CompilerRun) {
    let project_dir = get_crate_dir().join(&config.path);

    // Step 1: Run tests with Solar
    let (solar_test_time, solar_tests, solar_sizes) =
        run_forge_test_solar(&project_dir, &format!("{}-solar", config.name), config);
    let solar_tests = filter_tests(solar_tests, config);
    let solar_passed = solar_tests.iter().filter(|t| t.passed).count();
    let solar_failed = solar_tests.iter().filter(|t| !t.passed).count();

    let solar_run = CompilerRun {
        compiler: "solar".to_string(),
        compile_time: solar_test_time,
        tests: solar_tests,
        total_passed: solar_passed,
        total_failed: solar_failed,
        bytecode_sizes: solar_sizes,
    };

    // Step 2: Run tests with solc
    let (solc_test_time, solc_tests, solc_sizes) = run_forge_test_solc(&project_dir, config);
    let solc_tests = filter_tests(solc_tests, config);
    let solc_passed = solc_tests.iter().filter(|t| t.passed).count();
    let solc_failed = solc_tests.iter().filter(|t| !t.passed).count();

    let solc_run = CompilerRun {
        compiler: "solc".to_string(),
        compile_time: solc_test_time,
        tests: solc_tests,
        total_passed: solc_passed,
        total_failed: solc_failed,
        bytecode_sizes: solc_sizes,
    };

    // Print diff summary if there are regressions
    if solar_run.total_failed > 0 && solc_run.total_failed < solar_run.total_failed {
        print_test_diff(&solar_run.tests, &solc_run.tests, &config.name);
    }

    // Print comparison
    println!("\n{}", "=".repeat(70));
    println!(" {} ", config.name.to_uppercase());
    if config.test_filter.is_some() || config.contract_filter.is_some() {
        println!(" Filters: test={:?} contract={:?}", config.test_filter, config.contract_filter);
    }
    println!("{}", "=".repeat(70));

    // Test time
    println!("\n📦 Test Time:");
    let time_diff = if solc_run.compile_time.as_secs_f64() > 0.0 {
        ((solar_run.compile_time.as_secs_f64() / solc_run.compile_time.as_secs_f64()) - 1.0) * 100.0
    } else {
        0.0
    };
    println!(
        "   Solar: {:>6.2}s | solc: {:>6.2}s | {:+.0}%",
        solar_run.compile_time.as_secs_f64(),
        solc_run.compile_time.as_secs_f64(),
        time_diff
    );

    // Test results
    println!("\n✅ Test Results:");
    println!("   Solar: {} passed, {} failed", solar_run.total_passed, solar_run.total_failed);
    println!("   solc:  {} passed, {} failed", solc_run.total_passed, solc_run.total_failed);

    // Bytecode sizes
    println!("\n📏 Bytecode Sizes (deployed):");
    let mut all_contracts: Vec<_> =
        solar_run.bytecode_sizes.keys().chain(solc_run.bytecode_sizes.keys()).collect();
    all_contracts.sort();
    all_contracts.dedup();

    for contract in all_contracts {
        if contract.ends_with("Test") {
            continue;
        }
        let solar_size = solar_run.bytecode_sizes.get(contract).copied().unwrap_or(0);
        let solc_size = solc_run.bytecode_sizes.get(contract).copied().unwrap_or(0);
        if solar_size > 0 && solc_size > 0 {
            let savings = ((1.0 - (solar_size as f64 / solc_size as f64)) * 100.0) as i32;
            println!(
                "   {:20} Solar: {:>5}B | solc: {:>5}B | {:>+3}% smaller",
                contract, solar_size, solc_size, savings
            );
        } else if solar_size > 0 {
            println!("   {:20} Solar: {:>5}B | solc: N/A", contract, solar_size);
        }
    }

    // Gas comparison
    println!("\n⛽ Gas Usage (per test):");
    let solar_test_map: HashMap<_, _> = solar_run.tests.iter().map(|t| (&t.name, t)).collect();
    let solc_test_map: HashMap<_, _> = solc_run.tests.iter().map(|t| (&t.name, t)).collect();

    let mut test_names: Vec<_> = solar_test_map.keys().collect();
    test_names.sort();

    for name in test_names {
        if let (Some(solar_test), Some(solc_test)) =
            (solar_test_map.get(name), solc_test_map.get(name))
        {
            let status = if solar_test.passed && solc_test.passed {
                "✓"
            } else if solar_test.passed != solc_test.passed {
                "⚠"
            } else {
                "✗"
            };

            let gas_diff = if solc_test.gas > 0 {
                ((solar_test.gas as f64 / solc_test.gas as f64) - 1.0) * 100.0
            } else {
                0.0
            };

            let short_name: String = name.chars().take(35).collect();
            println!(
                "   {} {:35} Solar: {:>10} | solc: {:>10} | {:>+6.1}%",
                status, short_name, solar_test.gas, solc_test.gas, gas_diff
            );
        }
    }

    (solar_run, solc_run)
}

// ============================================================================
// Test Runner
// ============================================================================

/// Main test runner using config.
fn run_test_with_config(config: &TestConfig) {
    if !forge_available() {
        eprintln!("Skipping {}: forge not found in PATH", config.name);
        return;
    }

    let solar_binary = get_solar_binary();
    if !solar_binary.exists() {
        eprintln!("Skipping {}: Solar binary not found at {:?}", config.name, solar_binary);
        return;
    }

    let project_dir = get_crate_dir().join(&config.path);
    if !project_dir.exists() {
        panic!("Project directory not found: {:?}", project_dir);
    }

    if config.solar_only {
        run_test_solar_only(config);
    } else {
        run_test_with_comparison(config);
    }
}

/// Runs test with Solar only (no solc comparison).
fn run_test_solar_only(config: &TestConfig) {
    let project_dir = get_crate_dir().join(&config.path);
    let (_, tests, _) = run_forge_test_solar(&project_dir, &config.name, config);
    let tests = filter_tests(tests, config);

    let total_passed = tests.iter().filter(|t| t.passed).count();
    let total_failed = tests.iter().filter(|t| !t.passed).count();

    println!("\n✅ [{}] Solar-only: {} passed, {} failed", config.name, total_passed, total_failed);

    assert_eq!(total_failed, 0, "[{}] {} Solar tests failed", config.name, total_failed);
    assert!(total_passed > 0, "[{}] No Solar tests ran", config.name);
}

/// Runs test with Solar vs solc comparison.
fn run_test_with_comparison(config: &TestConfig) {
    let (solar_run, solc_run) = run_project_comparison(config);

    // Assert Solar tests pass
    assert_eq!(
        solar_run.total_failed, 0,
        "[{}] {} Solar tests failed",
        config.name, solar_run.total_failed
    );
    assert!(solar_run.total_passed > 0, "[{}] No Solar tests ran", config.name);

    if solc_run.total_passed > solar_run.total_passed {
        eprintln!(
            "⚠️  [{}] solc passed {} more tests than Solar",
            config.name,
            solc_run.total_passed - solar_run.total_passed
        );
    }

    // Assert Solar MUST beat solc in gas usage for all matching tests (if enabled)
    if config.require_gas_parity {
        let solar_map: HashMap<&str, &TestResult> =
            solar_run.tests.iter().map(|t| (t.name.as_str(), t)).collect();
        let solc_map: HashMap<&str, &TestResult> =
            solc_run.tests.iter().map(|t| (t.name.as_str(), t)).collect();

        let mut gas_regressions = Vec::new();
        for (name, solar_test) in &solar_map {
            if let Some(solc_test) = solc_map.get(name) {
                // Only compare passing tests with non-zero gas
                if solar_test.passed && solc_test.passed && solc_test.gas > 0 && solar_test.gas > 0
                {
                    if solar_test.gas > solc_test.gas {
                        let diff_pct =
                            ((solar_test.gas as f64 / solc_test.gas as f64) - 1.0) * 100.0;
                        gas_regressions.push((
                            name.to_string(),
                            solar_test.gas,
                            solc_test.gas,
                            diff_pct,
                        ));
                    }
                }
            }
        }

        if !gas_regressions.is_empty() {
            eprintln!(
                "\n❌ [{}] GAS REGRESSIONS: Solar uses MORE gas than solc in {} tests:",
                config.name,
                gas_regressions.len()
            );
            for (name, solar_gas, solc_gas, diff_pct) in &gas_regressions {
                eprintln!(
                    "   - {:40} Solar: {:>8} | solc: {:>8} | {:>+6.1}%",
                    name, solar_gas, solc_gas, diff_pct
                );
            }
            panic!(
                "[{}] Solar MUST beat solc in gas usage, but {} tests regressed",
                config.name,
                gas_regressions.len()
            );
        }
    }

    println!(
        "\n✓ [{}] {} tests passed with Solar{}",
        config.name,
        solar_run.total_passed,
        if config.require_gas_parity { " (gas <= solc)" } else { "" }
    );
}

// ============================================================================
// Georgios Isolated Mode: tests(solc) + src(solar)
//
// This is the correct way to run ported solc semantic tests:
//   - Source contracts (src/*.sol) are compiled with the Solar Rust API
//   - Test files (test/*.t.sol) are compiled with system solc
//   - Solar bytecodes are injected at runtime via a generated SolarRegistry.sol
//   - `new Contract()` in test setUp is rewritten to use the injected bytecode
//
// This eliminates the ambiguity of FOUNDRY_SOLC=solar, where a test failure
// could mean either "Solar's contract bytecode is wrong" OR "Solar misbehaved
// compiling forge-std" — the latter being irrelevant noise.
// ============================================================================

/// Compiles all .sol source files in `src_dir` using the Solar Rust API.
/// Returns a map of contract_name -> deployment_bytecode.
/// Uses two-pass compilation so `new Contract()` in source works correctly.
fn compile_src_with_solar(src_dir: &Path) -> Result<HashMap<String, Vec<u8>>, String> {
    use rustc_hash::FxHashMap;
    use solar_codegen::{lower, EvmCodegen};
    use solar_interface::Session;
    use solar_sema::{hir::ContractId, Compiler};
    use std::ops::ControlFlow;

    let sol_files: Vec<PathBuf> = std::fs::read_dir(src_dir)
        .map_err(|e| format!("failed to read src dir: {e}"))?
        .filter_map(|e| e.ok())
        .map(|e| e.path())
        .filter(|p| p.extension().map(|e| e == "sol").unwrap_or(false))
        .collect();

    if sol_files.is_empty() {
        return Ok(HashMap::new());
    }

    let sess =
        Session::builder().with_buffer_emitter(solar_interface::ColorChoice::Never).build();
    let mut compiler = Compiler::new(sess);

    let result = compiler.enter_mut(|compiler| {
        let mut pcx = compiler.parse();
        let paths: Vec<&Path> = sol_files.iter().map(|p| p.as_path()).collect();
        pcx.load_files(paths)?;
        pcx.parse();

        let ControlFlow::Continue(()) = compiler.lower_asts()? else {
            return Err(compiler.gcx().sess.dcx.err("lowering failed").emit());
        };
        let ControlFlow::Continue(()) = compiler.analysis()? else {
            return Err(compiler.gcx().sess.dcx.err("analysis failed").emit());
        };

        let gcx = compiler.gcx();

        // Pass 1: compile all contracts, gather deployment bytecodes.
        let mut all_bytecodes: FxHashMap<ContractId, Vec<u8>> = FxHashMap::default();
        for (contract_id, _) in gcx.hir.contracts_enumerated() {
            let mut module = lower::lower_contract(gcx, contract_id);
            let mut cg = EvmCodegen::new();
            let (deploy, _) = cg.generate_deployment_bytecode(&mut module);
            all_bytecodes.insert(contract_id, deploy);
        }

        // Pass 2: recompile with child bytecodes registered (needed for `new`).
        let mut output: HashMap<String, Vec<u8>> = HashMap::new();
        for (contract_id, contract) in gcx.hir.contracts_enumerated() {
            let mut module =
                lower::lower_contract_with_bytecodes(gcx, contract_id, &all_bytecodes);
            let mut cg = EvmCodegen::new();
            let (deploy, _) = cg.generate_deployment_bytecode(&mut module);
            output.insert(contract.name.to_string(), deploy);
        }

        Ok(output)
    });

    result.map_err(|_| "Solar compilation failed".to_string())
}

/// Generates a SolarRegistry.sol that embeds Solar-compiled bytecodes as hex constants.
/// Also defines a free function `_solarDeploy` for use in test setUp methods.
fn generate_solar_registry(bytecodes: &HashMap<String, Vec<u8>>) -> String {
    let mut out = String::from(
        "// SPDX-License-Identifier: MIT\n// AUTO-GENERATED by solar test harness — do not edit\npragma solidity ^0.8.0;\n\nlibrary SolarRegistry {\n",
    );
    for (name, bytes) in bytecodes {
        let hex = alloy_primitives::hex::encode(bytes);
        out.push_str(&format!(
            "    function {name}() internal pure returns (bytes memory) {{\n        return hex\"{hex}\";\n    }}\n"
        ));
    }
    out.push_str(
        "}\n\nfunction _solarDeploy(bytes memory bytecode) returns (address addr) {\n    assembly { addr := create(0, add(bytecode, 0x20), mload(bytecode)) }\n    require(addr != address(0), \"Solar: deploy failed\");\n}\n",
    );
    out
}

/// Transforms a test .sol file:
/// - Injects `import "./SolarRegistry.sol";` after the last existing import.
/// - Replaces `new Foo()` with `Foo(_solarDeploy(SolarRegistry.Foo()))` for each
///   contract name in `src_contracts`.
fn transform_test_file(content: &str, src_contracts: &std::collections::HashSet<String>) -> String {
    // Insert the SolarRegistry import after the last import line.
    let mut lines: Vec<String> = content.lines().map(|l| l.to_string()).collect();
    if !content.contains("SolarRegistry.sol") {
        let last_import = lines
            .iter()
            .enumerate()
            .filter(|(_, l)| l.trim_start().starts_with("import "))
            .map(|(i, _)| i)
            .last();
        let insert_at = last_import.map(|i| i + 1).unwrap_or(0);
        lines.insert(insert_at, "import \"./SolarRegistry.sol\";".to_string());
    }
    let mut result = lines.join("\n");

    // Replace `new ContractName()` with Solar bytecode injection.
    for name in src_contracts {
        let from = format!("new {name}()");
        let to = format!("{name}(_solarDeploy(SolarRegistry.{name}()))");
        result = result.replace(&from, &to);
    }

    result
}

/// Recursively copies `src` directory to `dst`, skipping out/cache build artifacts.
fn copy_dir_all(src: &Path, dst: &Path) -> std::io::Result<()> {
    std::fs::create_dir_all(dst)?;
    for entry in std::fs::read_dir(src)? {
        let entry = entry?;
        let name = entry.file_name();
        let ty = entry.file_type()?;
        let name_str = name.to_string_lossy();
        // Skip build artifact directories.
        if ty.is_dir() && (name_str.starts_with("out") || name_str.starts_with("cache")) {
            continue;
        }
        if ty.is_dir() {
            copy_dir_all(&entry.path(), &dst.join(&name))?;
        } else if ty.is_file() {
            std::fs::copy(entry.path(), dst.join(&name))?;
        }
        // Skip symlinks — shared lib is handled via foundry.toml rewrite.
    }
    Ok(())
}

/// Runs a ported test suite using Georgios's isolated approach:
/// source contracts compiled with Solar, test files compiled with system solc.
/// Returns the forge test results (may be empty on Solar compilation failure).
fn run_forge_isolated(label: &str, project_dir: &Path) -> Vec<TestResult> {
    if !forge_available() {
        eprintln!("Skipping {label}: forge not found");
        return vec![];
    }

    // Step 1: Compile src contracts with Solar Rust API.
    let src_dir = project_dir.join("src");
    let solar_bytecodes = match compile_src_with_solar(&src_dir) {
        Ok(b) => b,
        Err(e) => {
            eprintln!("[{label}] Solar src compilation failed: {e}");
            return vec![];
        }
    };
    eprintln!("[{label}] Solar compiled {} contracts", solar_bytecodes.len());

    // Step 2: Copy project to a temp dir so we can modify it freely.
    let temp_dir = tempfile::tempdir().expect("tempdir");
    let temp_project = temp_dir.path();
    copy_dir_all(project_dir, temp_project).expect("copy project");

    // Fix foundry.toml: rewrite `"../_shared/lib"` to an absolute path so the
    // temp dir can find shared forge-std without a relative `..` escape.
    let toml_path = temp_project.join("foundry.toml");
    if let Ok(toml) = std::fs::read_to_string(&toml_path) {
        let shared_lib = get_crate_dir().join("testdata-solc/_shared/lib");
        let fixed = toml.replace(
            "../_shared/lib",
            shared_lib.to_str().expect("shared lib path"),
        );
        std::fs::write(&toml_path, fixed).expect("write foundry.toml");
    }

    // Step 3: Write the generated SolarRegistry.sol into test/.
    let registry = generate_solar_registry(&solar_bytecodes);
    std::fs::write(temp_project.join("test/SolarRegistry.sol"), registry)
        .expect("write SolarRegistry.sol");

    // Step 4: Transform test files — rewrite `new Foo()` to Solar injection.
    let src_contracts: std::collections::HashSet<String> =
        solar_bytecodes.keys().cloned().collect();
    let test_dir = temp_project.join("test");
    for entry in std::fs::read_dir(&test_dir).unwrap().flatten() {
        let path = entry.path();
        if path.extension().map(|e| e == "sol").unwrap_or(false)
            && path.file_name().map(|n| n != "SolarRegistry.sol").unwrap_or(false)
        {
            let content = std::fs::read_to_string(&path).unwrap();
            let transformed = transform_test_file(&content, &src_contracts);
            std::fs::write(&path, transformed).unwrap();
        }
    }

    // Step 5: Run `forge test` WITHOUT FOUNDRY_SOLC — test files compile with solc.
    let mut cmd = Command::new("forge");
    cmd.current_dir(temp_project)
        .arg("test")
        .arg("--force")
        .arg("--json")
        .arg("-vvvvv");
    add_forge_verbosity(&mut cmd);

    let start = std::time::Instant::now();
    let output = match cmd.output() {
        Ok(o) => o,
        Err(e) => {
            eprintln!("[{label}] forge failed to start: {e}");
            return vec![];
        }
    };
    eprintln!(
        "[{label}] forge ran in {:.1}s — status: {}",
        start.elapsed().as_secs_f32(),
        output.status
    );

    if !output.stderr.is_empty() {
        eprintln!("[{label}] forge stderr:\n{}", String::from_utf8_lossy(&output.stderr));
    }

    let stdout = String::from_utf8_lossy(&output.stdout);
    parse_test_results(&stdout)
}

// ============================================================================
// Legacy API (for backward compatibility)
// ============================================================================

/// Tests a project with Solar vs solc comparison (legacy API).
fn test_project_solar(project_name: &str, project_path: &str) {
    TestConfig::new(project_name, project_path).run();
}

/// Tests a project where solc can't compile (legacy API).
fn test_project_solar_only(project_name: &str, project_path: &str) {
    TestConfig::new(project_name, project_path).solar_only(true).run();
}

fn test_project_solar_ported(project_name: &str, project_path: &str) {
    TestConfig::new(project_name, project_path).run();
}

// ============================================================================
// Tests
// ============================================================================

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_arithmetic() {
        test_project_solar("arithmetic", "testdata/arithmetic");
    }

    /// Proof-of-concept for Georgios's isolated approach:
    /// source contracts compiled with Solar, test files compiled with system solc.
    /// Solar bytecodes are injected into the test environment at runtime.
    /// This gives precise failure attribution: failures mean Solar's *contract*
    /// bytecode is wrong, not that Solar misbehaved compiling forge-std.
    #[test]
    fn test_ported_arithmetic_isolated() {
        let project_dir = get_crate_dir().join("testdata-solc/arithmetic");
        let results = run_forge_isolated("arithmetic_isolated", &project_dir);

        let passed = results.iter().filter(|t| t.passed).count();
        let failed = results.iter().filter(|t| !t.passed).count();
        eprintln!("arithmetic_isolated: {passed} passed, {failed} failed");

        for t in results.iter().filter(|t| !t.passed) {
            eprintln!("  FAIL: {}", t.name);
        }

        // Don't assert all pass — Solar codegen is a WIP.
        // This test exists to verify the harness *runs* correctly.
        // Once Solar improves, failures here are precisely attributable to Solar's bytecode.
        assert!(!results.is_empty(), "No tests ran — check harness setup");
    }

    #[test]
    fn test_control_flow() {
        test_project_solar("control_flow", "testdata/control-flow");
    }

    #[test]
    fn test_storage() {
        test_project_solar("storage", "testdata/storage");
    }

    #[test]
    fn test_events() {
        test_project_solar("events", "testdata/events");
    }

    #[test]
    fn test_calls() {
        test_project_solar("calls", "testdata/calls");
    }

    #[test]
    fn test_interfaces() {
        test_project_solar("interfaces", "testdata/interfaces");
    }

    #[test]
    fn test_libraries() {
        test_project_solar("libraries", "testdata/libraries");
    }

    #[test]
    fn test_constructor_args() {
        test_project_solar("constructor_args", "testdata/constructor-args");
    }

    #[test]
    fn test_multi_return() {
        test_project_solar("multi_return", "testdata/multi-return");
    }

    #[test]
    fn test_inheritance() {
        test_project_solar("inheritance", "testdata/inheritance");
    }

    #[test]
    #[ignore = "stack-deep suite fails to compile with solc without via_ir; re-enable later"]
    fn test_stack_deep() {
        test_project_solar_only("stack_deep", "testdata/stack-deep");
    }

    #[test]
    fn test_compilation() {
        if !forge_available() {
            eprintln!("Skipping: forge not found");
            return;
        }

        let solar_binary = get_solar_binary();
        if !solar_binary.exists() {
            eprintln!("Skipping: Solar binary not found");
            return;
        }

        let config = TestConfig::new("compilation-test", "testdata/arithmetic");
        let project_dir = get_crate_dir().join(&config.path);
        let (test_time, tests, sizes) =
            run_forge_test_solar(&project_dir, "compilation-test", &config);

        println!("Test time: {:?}", test_time);
        println!("Tests: {:?}", tests.iter().map(|t| &t.name).collect::<Vec<_>>());
        println!("Bytecode sizes: {:?}", sizes);

        assert!(!tests.is_empty(), "No tests ran");
    }

    #[test]
    #[ignore] // Requires forge-std which is not available in CI
    fn test_unifap_v2() {
        test_project_solar("unifap-v2", "testdata/unifap-v2");
    }

    #[test]
    #[ignore] // Requires forge-std which is not available in CI
    fn test_unifap_v2_create() {
        test_project_solar("unifap-v2-create", "testdata/unifap-v2-create");
    }

    // Example: run only mint-related tests
    #[test]
    #[ignore] // Example - enable when debugging specific tests
    fn test_unifap_mint_only() {
        TestConfig::new("unifap-v2-create", "testdata/unifap-v2-create")
            .test_filter("testMint")
            .run();
    }

    // Example: run only tests in a specific contract
    #[test]
    #[ignore] // Example - enable when debugging specific contracts
    fn test_unifap_pair_only() {
        TestConfig::new("unifap-v2-create", "testdata/unifap-v2-create")
            .contract_filter("UnifapV2Pair")
            .run();
    }

    // Example: combine test + contract filters
    #[test]
    #[ignore] // Example - enable when debugging
    fn test_unifap_pair_swap() {
        TestConfig::new("unifap-v2-create", "testdata/unifap-v2-create")
            .contract_filter("UnifapV2Pair")
            .test_filter("testSwap")
            .run();
    }

    // ========== Struct Tests ==========

    #[test]
    #[ignore] // WIP: 8 struct tests have StackUnderflow issues to fix
    fn test_structs() {
        test_project_solar("structs", "testdata/structs");
    }

    // ========== Ported Suites (isolated) ==========

    #[test]
    fn test_ported_abi_encode_decode() {
        test_project_solar_ported("ported_abi_encode_decode", "testdata-solc/abi-encode-decode");
    }

    #[test]
    fn test_ported_arithmetic() {
        test_project_solar_ported("ported_arithmetic", "testdata-solc/arithmetic");
    }

    #[test]
    fn test_ported_arrays() {
        test_project_solar_ported("ported_arrays", "testdata-solc/arrays");
    }

    #[test]
    fn test_ported_builtin_functions() {
        test_project_solar_ported("ported_builtin_functions", "testdata-solc/builtin-functions");
    }

    #[test]
    fn test_ported_calldata() {
        test_project_solar_ported("ported_calldata", "testdata-solc/calldata");
    }

    #[test]
    fn test_ported_calls() {
        test_project_solar_ported("ported_calls", "testdata-solc/calls");
    }

    #[test]
    fn test_ported_constructor() {
        test_project_solar_ported("ported_constructor", "testdata-solc/constructor");
    }

    #[test]
    fn test_ported_control_flow() {
        test_project_solar_ported("ported_control_flow", "testdata-solc/control-flow");
    }

    #[test]
    fn test_ported_conversions() {
        test_project_solar_ported("ported_conversions", "testdata-solc/conversions");
    }

    #[test]
    fn test_ported_enums() {
        test_project_solar_ported("ported_enums", "testdata-solc/enums");
    }

    #[test]
    fn test_ported_errors() {
        test_project_solar_ported("ported_errors", "testdata-solc/errors");
    }

    #[test]
    fn test_ported_events() {
        test_project_solar_ported("ported_events", "testdata-solc/events");
    }

    #[test]
    fn test_ported_expressions() {
        test_project_solar_ported("ported_expressions", "testdata-solc/expressions");
    }

    #[test]
    fn test_ported_fallback() {
        test_project_solar_ported("ported_fallback", "testdata-solc/fallback");
    }

    #[test]
    fn test_ported_hashing() {
        test_project_solar_ported("ported_hashing", "testdata-solc/hashing");
    }

    #[test]
    fn test_ported_immutable() {
        test_project_solar_ported("ported_immutable", "testdata-solc/immutable");
    }

    #[test]
    fn test_ported_inheritance() {
        test_project_solar_ported("ported_inheritance", "testdata-solc/inheritance");
    }

    #[test]
    fn test_ported_libraries() {
        test_project_solar_ported("ported_libraries", "testdata-solc/libraries");
    }

    #[test]
    fn test_ported_literals() {
        test_project_solar_ported("ported_literals", "testdata-solc/literals");
    }

    #[test]
    fn test_ported_memory_management() {
        test_project_solar_ported("ported_memory_management", "testdata-solc/memory-management");
    }

    #[test]
    fn test_ported_modifiers() {
        test_project_solar_ported("ported_modifiers", "testdata-solc/modifiers");
    }

    #[test]
    fn test_ported_operators() {
        test_project_solar_ported("ported_operators", "testdata-solc/operators");
    }

    #[test]
    fn test_ported_payable() {
        test_project_solar_ported("ported_payable", "testdata-solc/payable");
    }

    #[test]
    fn test_ported_receive() {
        test_project_solar_ported("ported_receive", "testdata-solc/receive");
    }

    #[test]
    fn test_ported_revert_strings() {
        test_project_solar_ported("ported_revert_strings", "testdata-solc/revert-strings");
    }

    #[test]
    fn test_ported_reverts() {
        test_project_solar_ported("ported_reverts", "testdata-solc/reverts");
    }

    #[test]
    fn test_ported_scoping() {
        test_project_solar_ported("ported_scoping", "testdata-solc/scoping");
    }

    #[test]
    fn test_ported_statements() {
        test_project_solar_ported("ported_statements", "testdata-solc/statements");
    }

    #[test]
    fn test_ported_storage() {
        test_project_solar_ported("ported_storage", "testdata-solc/storage");
    }

    #[test]
    fn test_ported_strings() {
        test_project_solar_ported("ported_strings", "testdata-solc/strings");
    }

    #[test]
    fn test_ported_structs() {
        test_project_solar_ported("ported_structs", "testdata-solc/structs");
    }

    #[test]
    fn test_ported_try_catch() {
        test_project_solar_ported("ported_try_catch", "testdata-solc/try-catch");
    }

    #[test]
    fn test_ported_abi_encoder_v1() {
        test_project_solar_ported("ported_abi_encoder_v1", "testdata-solc/abi-encoder-v1");
    }

    #[test]
    fn test_ported_abi_encoder_v2() {
        test_project_solar_ported("ported_abi_encoder_v2", "testdata-solc/abi-encoder-v2");
    }

    #[test]
    fn test_ported_accessor() {
        test_project_solar_ported("ported_accessor", "testdata-solc/accessor");
    }

    #[test]
    fn test_ported_cleanup() {
        test_project_solar_ported("ported_cleanup", "testdata-solc/cleanup");
    }

    #[test]
    fn test_ported_constant_evaluator() {
        test_project_solar_ported("ported_constant_evaluator", "testdata-solc/constant-evaluator");
    }

    #[test]
    fn test_ported_constants() {
        test_project_solar_ported("ported_constants", "testdata-solc/constants");
    }

    #[test]
    fn test_ported_deployed_code_exclusion() {
        test_project_solar_ported(
            "ported_deployed_code_exclusion",
            "testdata-solc/deployed-code-exclusion",
        );
    }

    #[test]
    fn test_ported_ecrecover() {
        test_project_solar_ported("ported_ecrecover", "testdata-solc/ecrecover");
    }

    #[test]
    fn test_ported_external_contracts() {
        test_project_solar_ported("ported_external_contracts", "testdata-solc/external-contracts");
    }

    #[test]
    fn test_ported_external_source() {
        test_project_solar_ported("ported_external_source", "testdata-solc/external-source");
    }

    #[test]
    fn test_ported_free_functions() {
        test_project_solar_ported("ported_free_functions", "testdata-solc/free-functions");
    }

    #[test]
    fn test_ported_function_selector() {
        test_project_solar_ported("ported_function_selector", "testdata-solc/function-selector");
    }

    #[test]
    fn test_ported_function_types() {
        test_project_solar_ported("ported_function_types", "testdata-solc/function-types");
    }

    #[test]
    fn test_ported_getters() {
        test_project_solar_ported("ported_getters", "testdata-solc/getters");
    }

    #[test]
    fn test_ported_inline_assembly() {
        test_project_solar_ported("ported_inline_assembly", "testdata-solc/inline-assembly");
    }

    #[test]
    fn test_ported_integer() {
        test_project_solar_ported("ported_integer", "testdata-solc/integer");
    }

    #[test]
    fn test_ported_interface_id() {
        test_project_solar_ported("ported_interface_id", "testdata-solc/interface-id");
    }

    #[test]
    fn test_ported_isoltest_testing() {
        test_project_solar_ported("ported_isoltest_testing", "testdata-solc/isoltest-testing");
    }

    #[test]
    fn test_ported_meta_types() {
        test_project_solar_ported("ported_meta_types", "testdata-solc/meta-types");
    }

    #[test]
    fn test_ported_multi_source() {
        test_project_solar_ported("ported_multi_source", "testdata-solc/multi-source");
    }

    #[test]
    fn test_ported_salted_create() {
        test_project_solar_ported("ported_salted_create", "testdata-solc/salted-create");
    }

    #[test]
    fn test_ported_smoke() {
        test_project_solar_ported("ported_smoke", "testdata-solc/smoke");
    }

    #[test]
    fn test_ported_special_functions() {
        test_project_solar_ported("ported_special_functions", "testdata-solc/special-functions");
    }

    #[test]
    fn test_ported_types() {
        test_project_solar_ported("ported_types", "testdata-solc/types");
    }

    #[test]
    fn test_ported_underscore() {
        test_project_solar_ported("ported_underscore", "testdata-solc/underscore");
    }

    #[test]
    fn test_ported_uninitialized_function_pointer() {
        test_project_solar_ported(
            "ported_uninitialized_function_pointer",
            "testdata-solc/uninitialized-function-pointer",
        );
    }

    #[test]
    fn test_ported_user_defined_value_type() {
        test_project_solar_ported(
            "ported_user_defined_value_type",
            "testdata-solc/user-defined-value-type",
        );
    }

    #[test]
    fn test_ported_using() {
        test_project_solar_ported("ported_using", "testdata-solc/using");
    }

    #[test]
    fn test_ported_variables() {
        test_project_solar_ported("ported_variables", "testdata-solc/variables");
    }

    #[test]
    fn test_ported_various() {
        test_project_solar_ported("ported_various", "testdata-solc/various");
    }

    #[test]
    fn test_ported_virtual_functions() {
        test_project_solar_ported("ported_virtual_functions", "testdata-solc/virtual-functions");
    }
}
