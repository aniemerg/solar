# Agent Instructions: Extend `emit_value_fresh` for Basic Ops

Branch context: `codegen-mir` (Solar codegen MIR branch). This task is about extending Solar codegen for re-executable simple ops used as call operands.

## Goal
Extend `emit_value_fresh` to support the remaining basic arithmetic, bitwise, shift, and comparison instructions so CALL/STATICCALL/DELEGATECALL operands can be re-emitted safely without panicking. Keep behavior aligned with solc semantics; solc is the gold standard for these tests.

This should be a **small, localized change** in codegen that unlocks multiple tests without large refactors.

## Current state
File: `crates/codegen/src/codegen/evm.rs`
Function: `emit_value_fresh` (search for it around line ~1374).

It already re-emits values for:
- `Gas`, `CallValue`, `Caller`, `Origin`, `CalldataSize`, `Timestamp`, `BlockNumber`
- `MLoad`, `Keccak256`, `Add`, `Sub`, `Mul`

It panics on all other MIR instruction kinds when used as a CALL operand.

## What to implement
Add support in `emit_value_fresh` for the remaining **simple, deterministic MIR ops** that can be safely re-executed:

Arithmetic:
- `Div`, `SDiv`, `Mod`, `SMod`, `Exp`
- Consider `AddMod`, `MulMod` if they appear in operands (safe and deterministic)

Bitwise + shifts:
- `And`, `Or`, `Xor`, `Not`
- `Shl`, `Shr`, `Sar`
- `Byte`

Comparisons:
- `Lt`, `Gt`, `SLt`, `SGt`, `Eq`, `IsZero`

Implementation approach:
- Mirror the operand order and opcode emission used in the **regular emitter** (e.g., in `emit_inst` or equivalent) to avoid subtle order bugs.
- For each op: `emit_value_fresh` recursively for operands, emit the opcode, then **pop operands** and push the result on `scheduler.stack` (matching existing patterns in `Add/Sub/Mul`).
- Unary ops: pop one, push result. Binary ops: pop two, push result. Ternary (AddMod/MulMod): pop three, push result.

## Tests to validate (describe behavior, do not rely on existing ported tests)
The agent is working in a clean-room setting. You need to recreate tests that cover the behaviors below. These are the behaviors our ported Solidity tests exercise, and they must pass under solc semantics.

### Core arithmetic + comparisons
Create a contract with pure functions for:
- Unsigned `add/sub/mul/div/mod`
- Signed `div` (and optionally signed `mod`)
- Comparisons: `<`, `>`, `<=`, `>=`, `==`, `!=` for unsigned
- Signed comparisons: `<` and `>` for signed ints

Test expectations:
- Integer division truncates toward zero.
- `div/mod` by non-zero behave as expected.
- Comparisons return correct booleans.

### Shift operators
Create functions for `<<` and `>>` on `uint256`.
Test expectations:
- Shifting by 0 returns the same value.
- Large shifts (>= 256) yield zero for unsigned shifts.
- A few concrete vectors like:
  - `0x4266 << 8 == 0x426600`
  - `0x4266 >> 8 == 0x42`

### Exponentiation (`**`)
Create functions that compute exponentiation with:
- Literal base (e.g., `2 ** x` and `-2 ** x` in unchecked context)
- Signed base with exponent from small uints
- Small exponent edge case where the result is known (e.g., a large base with exponent producing `4`)

Test expectations:
- Match solc’s overflow/underflow rules inside `unchecked`.
- Signed exponentiation matches solc’s sign behavior.

### Division / modulo by zero (reverts)
Create a contract with `unchecked` div/mod functions.
Tests should assert that division or modulo by zero **still reverts** (solc behavior) even inside `unchecked`.

### Local second operand regression
Create a function that:
- Loads a local variable `_x` from storage
- Uses `_x` as the **second operand** in `a / _x` and `b / _x` (and similarly for `%` and `-`)
- Reuses `_x` multiple times

Tests should assert correct results for multiple uses of the same local variable as the second operand. This is a known stack/operand-order regression area.

### Compound assignments
Add functions that use `+=`, `-=`, `*=`, `/=` on state variables.
Tests should verify state updates are correct.

## Solc baseline (gold standard)
Solc passes these tests. Use solc as baseline when validating:

- Script to run solc on all ported suites: `scripts/run-solc-ported.sh`
- Solc path used locally: `/opt/homebrew/bin/solc` (can override with `FOUNDRY_SOLC=...`)

Example single-suite solc run:
```
cd crates/codegen/testdata/arithmetic
FOUNDRY_SOLC=/opt/homebrew/bin/solc forge test
```

## Solar test runs
Use Solar to validate the fix; for quick iteration you can run suite-local forge tests:

```
# Build solar binary (debug is fine)
cargo build -p solar-compiler

# Arithmetic suite with Solar
cd crates/codegen/testdata/arithmetic
FOUNDRY_SOLC=../../../../target/debug/solar forge test

# Operators suite with Solar
cd crates/codegen/testdata/operators
FOUNDRY_SOLC=../../../../target/debug/solar forge test
```

Harness runs if needed:
```
RUSTC=~/.cargo/bin/rustc ~/.cargo/bin/cargo +1.88.0 test -p solar-codegen --test foundry test_arithmetic -- --test-threads=1 --nocapture
```

## Best practices to follow (repo + codegen-mir)
- Keep changes localized and deterministic.
- Follow existing stack discipline: always update `scheduler.stack` consistently with emitted opcodes.
- Mirror the normal emitter’s operand order to avoid mismatched semantics.
- Avoid adding new dependencies or altering test structure.
- Update comments only if they clarify non-obvious behavior.
- If a MIR instruction is re-executable but depends on mutable state (e.g., `MLoad` of a moving pointer), be cautious and prefer spill reloads. The current function already documents this constraint—follow its intent.

## Expected outcome
- No more panics in `emit_value_fresh` for the listed simple ops.
- Arithmetic/Operator test suites pass under Solar, matching solc behavior.
- No regressions in existing call operand handling.

If needed, add small targeted tests, but prioritize making the existing ported tests pass.
