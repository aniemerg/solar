# Solidity -> Solar Codegen Test Porting Review

## Executive Summary

- The existing Solar repo already has a Foundry-based codegen harness under `crates/codegen/tests/` with many small
  Solidity test projects in `crates/codegen/testdata/`. These focus on runtime semantics and gas comparisons against
  solc.
- Solidity’s canonical codegen tests live primarily in `tmp/solidity/test/libsolidity/semanticTests/`. These tests
  are concise single-file (or multi-source) programs with expected call results or failures encoded after
  `// ----`. They are very rich and directly target runtime/codegen behavior.
- The most valuable porting targets are *semantic tests* that cover codegen-relevant behavior but avoid unsupported
  Solar features (per Solar codegen README) and overly strict gas/optimizer assumptions.
- Porting will require: (1) translating expectation comments into Foundry assertions, (2) handling multi-source
  tests, (3) normalizing EVM version assumptions, and (4) choosing an approach for revert / event verification
  without relying heavily on `forge-std`.

## Current Solar Codegen Harness (Baseline)

### Harness Location and Flow

- Harness entrypoint: `crates/codegen/tests/foundry.rs`
- Runner logic: `crates/codegen/tests/foundry_harness/mod.rs`
- Test projects: `crates/codegen/testdata/*` (each is a Foundry project with `src/` and `test/`)

The harness:
1. Runs `forge test` with `FOUNDRY_SOLC=solar`.
2. Runs `forge test` with solc for baseline.
3. Compares pass/fail and gas (optionally enforces Solar gas <= solc).

### Existing Codegen Testdata Projects (High-Level)

Current testdata directories:

- `arithmetic`, `control-flow`, `loop_optimization`, `operators` (basic codegen operations)
- `storage`, `structs`, `enums`, `stress-*` (storage layout and correctness)
- `events`, `calls`, `low-level-calls`, `interfaces`, `libraries`, `modifiers`, `inheritance`
- `constructor-args`, `receive-fallback`, `multi-return`, `multicall`, `access-control`
- `abi-encoding`, `hashing`, `equivalence`
- `edge-cases`, `stack-deep`, `stress-*`
- `erc20-minimal`, `erc721-minimal`, `vault-minimal`, `unifap-v2`, `unifap-v2-create`

Note: The README in `crates/codegen/tests/README.md` still calls out limitations such as external calls, events,
complex types, inheritance, etc. Some current testdata appears to go beyond those limitations, so the README may be
out of date. That mismatch matters when selecting Solidity tests to port.

### Implications for Porting

- The existing harness is *Foundry-based* (runtime tests). We should prefer Solidity semantic tests that check runtime
  behavior rather than compiler diagnostics or parsing errors.
- Ported tests must keep names stable (worker normalizes signatures) and avoid flakiness.
- Gas parity checks exist in the harness; we should avoid tests that expect solc-specific gas numbers unless we plan
  to disable or special-case those comparisons.

## Solidity Test Landscape (Codegen-Relevant)

The Solidity repo has a large test suite under `tmp/solidity/test/`. The most relevant areas for codegen are:

### 1) `test/libsolidity/semanticTests/` (Primary Target)

- This directory is the **main source of runtime/codegen expectations**.
- Tests are small Solidity programs with expected call outcomes after `// ----`.
- Multi-file tests use `==== Source: name.sol ====` sections.

Examples:

- Arithmetic overflow expectations:
  - `semanticTests/arithmetics/checked_add_v2.sol`
- Event emission ordering and encoding:
  - `semanticTests/events/event_indexed_mixed.sol`
- External calls and return data:
  - `semanticTests/functionCall/external_call.sol`
- Storage packing correctness:
  - `semanticTests/storage/packed_storage_structs_uint.sol`
- Revert semantics:
  - `semanticTests/reverts/revert.sol`
- ABI encoding/decoding:
  - `semanticTests/abiEncodeDecode/abi_decode_simple.sol`

Why these matter: they directly encode the semantics that codegen must implement.

### 2) `test/libsolidity/SolidityEndToEndTest.cpp`

- Large C++ end-to-end tests using the Solidity execution framework.
- Harder to port and much less convenient than `semanticTests`.
- Good for “gold” behaviors but not practical for the first pass.

### 3) `test/libsolidity/gasTests`, `optimizer`, `viaYul`, `memoryGuardTests`

- These depend on specific compiler optimizations, IR pipeline choices, or memory-safety annotations.
- They are often **not stable under Solar’s current codegen pipeline**.
- Useful later, but risky for the contest harness.

### 4) `test/externalTests/*`

- Integration with real-world protocols (Uniswap, Chainlink, etc.).
- Very heavy and not suitable for a deterministic harness.

### 5) Other Suites

- `syntaxTests/`, `analysis/`, `smoke/` are mostly parser / typechecker coverage, not codegen runtime.
- `libyul/` tests are for the Yul stack (not Solar’s primary surface today).

## Format and Porting Considerations

### Solidity Semantic Test Format

- Each test file ends with an expectations section:
  - `// ----` indicates expected calls/results.
  - `FAILURE` indicates revert or VM failure.
  - Some tests include gas expectations (not stable for Solar).
- Multi-source tests are embedded with `==== Source: file.sol ====` blocks.

Example expectation lines:

- `f(uint16,uint16): 65534, 0 -> 0xfffe`
- `f(uint16,uint16): 65535, 1 -> FAILURE, hex"4e487b71", 0x11`
- `deposit() ->` then `~ emit E(...): ...`

### Foundry Porting Constraints

- Foundry tests must be explicit `assert`-style checks.
- Reverts can be tested without `forge-std` by using low-level `call` and checking `success` + returndata.
- Event checks can be done by decoding logs manually or using `vm.expectEmit` (if we adopt `forge-std`).
- Multi-source tests require multiple Solidity files in the Foundry project `src/` directory.

### EVM Version and Feature Drift

- Solidity semantic tests frequently assume an EVM version (e.g., behavior pre/post Byzantium, Shanghai, Cancun).
- Solar codegen currently does not surface flexible EVM-version configuration in the harness.
- Tests that depend on version-specific behavior (e.g., `CREATE2`, `RETURNDATA`, EOF, new opcodes) should be
  deferred unless we explicitly fix the EVM version in the harness.

### Known Solar Codegen Gaps (From README)

- External calls, events, complex types, inheritance may be incomplete (README says unsupported).
- If we port tests that rely on these features, they should be marked as stretch or phased-in.

## Candidate Test Sets to Port (Prioritized)

### High Priority (MVP for Contest Harness)

Focus on behavior that is fundamental, widespread, and likely supported soon:

- `semanticTests/arithmetics/*`
  - Overflow vs unchecked semantics, signed/unsigned operations.
  - Note: Solar may not enforce overflow checks (README); only include tests that match intended semantics.
- `semanticTests/operators/*`, `semanticTests/expressions/*`, `semanticTests/statements/*`
  - Basic control flow, logical ops, ternaries, assignments.
- `semanticTests/storage/*`
  - Storage layout correctness, packing, array indexing.
  - Examples: `packed_storage_structs_uint.sol`, `storage_boundary_*`.
- `semanticTests/array/*` + `semanticTests/structs/*`
  - Basic memory/storage layout and copying.
- `semanticTests/functionCall/*` (subset)
  - Internal calls, returns, multiple returns.
  - Start with same-contract calls and simple external calls.
- `semanticTests/constructor/*`
  - Constructor arguments and initialization.
- `semanticTests/reverts/revert.sol`
  - Basic revert behavior (no revert strings).
- `semanticTests/abiEncodeDecode/*` (simple cases)
  - Start with simple static types; postpone complex nested ABI cases.

### Medium Priority (Phase 2)

- `semanticTests/events/*` (selected)
  - Events are codegen-heavy; log encoding correctness matters.
  - Prefer small tests like `event_indexed_mixed.sol` or `event_no_arguments.sol` first.
- `semanticTests/inheritance/*` and `virtualFunctions/*`
  - Dispatch and override correctness.
- `semanticTests/libraries/*` and `semanticTests/modifiers/*`
  - Reuse, delegate behavior, modifier execution order.
- `semanticTests/receive/*` and `semanticTests/fallback/*`
  - Fallback/receive logic and calldata handling.
- `semanticTests/errors/*` and `semanticTests/reverts/*`
  - Custom errors, richer revert data (if Solar implements ABI error encoding).

### Low Priority / Avoid (for Contest Harness)

- `semanticTests/optimizer/*`, `viaYul/*`, `memoryGuardTests/*`
  - Too dependent on IR pipeline or memory-safe asm options.
- `semanticTests/shanghai/*`, `semanticTests/eof/*`
  - Version-specific behavior.
- `semanticTests/revertStrings/*`
  - Very strict revert data expectations; high risk of mismatch.
- `test/externalTests/*`
  - Heavy and non-deterministic for a leaderboard harness.

## Porting Challenges and How to Address Them

### 1) Expectation Syntax to Foundry Assertions

- Solidity tests encode input/output lines; Foundry needs explicit `assert` calls.
- We should build a small translator script later, but manually porting can follow a consistent template:
  - `contract C { ... }`
  - `contract CTest { C c; function setUp() public { c = new C(); } ... }`
  - Use `assert` for return values.
  - Use `address(c).call(abi.encodeWithSignature(...))` for revert expectations.

### 2) Revert Semantics

- Many Solidity tests expect reverts on overflow or invalid operations.
- Solar codegen currently may not match these expectations (no overflow checks).
- Strategy:
  - Avoid overflow-revert tests initially.
  - Add explicit `unchecked` tests if Solar intends to be permissive.
  - Use low-level calls to check `success == false` and optionally verify returndata.

### 3) Event Assertions

- Solidity tests often specify exact topics/data ordering.
- Foundry can check logs, but without `forge-std` we must decode logs manually.
- Recommended:
  - Either adopt `forge-std/Test.sol` for `vm.expectEmit`, or
  - Build a lightweight log decoder in Solidity using `vm.recordLogs` (requires cheatcodes).

### 4) ABI Encoder Differences

- Tests in `abiEncodeDecode` and `revertStrings` are sensitive to ABI rules.
- Solar’s ABI encoder might not match solc 1:1 initially.
- Start with simple static-type encoding, then expand to dynamic arrays, strings, nested tuples.

### 5) Multi-Source Tests

- Many tests in `semanticTests/multiSource` and `inheritance` depend on imports.
- Foundry supports this via multiple files in `src/`, but porting is more work.
- Recommendation: batch multi-source tests later after the single-file set is stable.

## Recommended Porting Approach

1. **Create a “semantic-tests” Foundry project** inside `crates/codegen/testdata/` (or in the new harness if we
   split it out). The goal is to map Solidity semantic tests one-to-one in structure.
2. **Phase 1 (Core Semantics)**: arithmetic, storage, control flow, and internal calls.
3. **Phase 2 (External Interfaces)**: events, external calls, libraries, modifiers, inheritance.
4. **Phase 3 (ABI and Edge Cases)**: ABI encode/decode, revert data, multi-source, versioned behavior.
5. **Maintain a porting ledger**: a markdown table listing each Solidity test (path) and its ported status with
   notes about deviations or skipped features.

## Specific Solidity Tests Worth Porting Early

The following are small, high-signal tests that map cleanly to Foundry and codegen correctness:

- `semanticTests/arithmetics/checked_add_v2.sol`
- `semanticTests/arithmetics/unchecked_div_by_zero.sol` (if Solar behavior matches)
- `semanticTests/storage/packed_storage_structs_uint.sol`
- `semanticTests/storage/simple_accessor.sol`
- `semanticTests/functionCall/external_call.sol`
- `semanticTests/functionCall/multiple_return_values.sol`
- `semanticTests/constructor/state_variable_initialization.sol`
- `semanticTests/events/event_no_arguments.sol` (if event support exists)
- `semanticTests/reverts/revert.sol`
- `semanticTests/abiEncodeDecode/abi_decode_simple.sol`

## Gaps Between Solar and Solidity Tests

- Solar’s current testdata already covers many areas (calls, events, inheritance, etc.), but the harness does not
  mirror the breadth of Solidity semantic tests.
- Solidity tests include a huge number of micro-tests for very specific edge cases; porting all would be massive.
- The contest harness should prefer **representative tests** that are small but high-signal, and add a curated
  edge-case set later.

## Suggested Next Deliverables

- A `PORTING_LEDGER.md` tracking each Solidity test, its ported status, and any deviations.
- A minimal template for ported tests (one per category).
- A set of scripts (optional) to parse Solidity expectation sections and generate Foundry test skeletons.

