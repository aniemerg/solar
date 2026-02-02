# AGENTS.md

Guidance for AI coding agents working in this repository.

## Project Overview

Solar is a blazingly fast, modular Solidity compiler written in Rust, aiming to be a modern alternative to solc.

## Harness Purpose (Leaderboard)

This repo is the canonical test harness source for the Solar leaderboard worker. The worker pins a specific commit and
uses its test suite + testdata as the fixed reference for scoring.

Key constraints:

- Tests define the exact evaluation criteria; keep names and structure stable.
- Harness must be deterministic; no external state or flaky behavior.
- Adding/removing tests requires regenerating the solc baseline and re-pinning the worker’s harness commit.
- Missing baseline tests are treated as failures.
- Raw forge output must remain compatible with existing parsers.
- Worker runs tests single-threaded (`--test-threads=1`).

Recommended layout (match worker expectations):

- `testdata/` for fixed contracts (organized by folder).
- `harness/` for the Rust test runner crate + `tests/` (e.g., foundry runner).
- `parse-results.py` and `test-manifest.json` if keeping those conventions.

## Porting Solidity Codegen Tests

- Source tests come from the Solidity repo at `https://github.com/argotorg/solidity`.
- Maintain stable, unique test names (signatures are stripped by the worker).
- Document any deviations (skips, semantic changes) to avoid score regressions.
- Prefer adding a parallel harness directory while iterating; keep the existing harness intact until validated.

### Temporary Solidity Repo Mirror

- Clone the Solidity repo into `tmp/solidity/` (repo-local and git-ignored) for direct reference during porting.
  - Path: `./tmp/solidity`
  - This directory must remain out of version control.

### Current Harness Constraint (Worker Compatibility)

- The leaderboard worker currently copies tests from `crates/codegen/testdata/` (not top-level `testdata/`).
- Ported Solidity semantic tests should live under `crates/codegen/testdata/` for now to stay compatible with the
  existing evaluation scripts.
- Prefer placing ported tests directly into category folders (e.g., `crates/codegen/testdata/inheritance/`) rather than
  a `semantic/` subfolder, to align with the current harness category discovery.

### Porting Style Notes

- Use existing Solar codegen tests as the “gold standard” for structure and naming.
- `forge-std` is allowed (already used in `unifap-v2*`), but keep usage minimal and consistent.
- Test function names must be globally unique across categories (baseline lookup is by test name only).

## Worker-Side Notes

- Harness commit is pinned by the worker (scripts expect a stable layout under `scripts/leaderboard/harness/solar`).
- Baseline generation uses `scripts/leaderboard/generate-baseline.py` and expects the same layout as evaluation.
- Keep old and new harnesses side-by-side if needed; the worker can switch via an env var.

## Commands

```bash
cargo build                                      # Build
cargo nextest run --workspace                    # Run tests (faster than cargo test)
cargo uitest                                     # Run UI tests
cargo uibless                                    # Update UI test expectations
cargo +nightly fmt --all                         # Format (CI uses nightly)
cargo clippy --workspace --all-targets           # Lint
cargo run -- file.sol                            # Run compiler
cargo run -- -Zhelp                              # Unstable flags help
```

## Architecture

- **solar-parse**: Lexer and parser
- **solar-ast**: AST definitions and visitors
- **solar-sema**: Semantic analysis (symbol resolution, type checking)
- **solar-interface**: Diagnostics and source management
- **solar-cli**: Command-line interface

Pipeline: Lexing → Parsing → Semantic Analysis → (IR → Codegen, planned)

### Visitor Pattern

Use `type BreakValue = Never` if visitor never breaks. Override `visit_*` methods and always call `walk_*` to continue traversal:

```rust
fn visit_expr(&mut self, expr: &'ast Expr) -> ControlFlow<Self::BreakValue> {
    // Your logic here
    walk_expr(self, expr)  // Always use walk_* for child traversal
}
```

## Testing

- **Unit tests**: In source files
- **UI tests**: In `tests/ui/`, verify compiler output
- Auxiliary files go in `auxiliary/` subdirectory

### UI Test Annotations

```solidity
//@compile-flags: --emit=abi
contract Test {
    uint x; //~ ERROR: message here
    //~^ NOTE: note about previous line
}
```

Annotations: `//~ ERROR:`, `//~ WARN:`, `//~ NOTE:`, `//~ HELP:`
Use `^` or `v` to point to lines above/below.

## Notes

- **Symbol comparisons**: Use `sym::name` or `kw::Keyword` instead of `.as_str()` for performance. Add new symbols to `crates/macros/src/symbols.rs`.
- **Arena allocation**: AST nodes use arenas for performance.
- **Benchmarks**: See @benches/README.md to benchmark when working on performance-critical code.
