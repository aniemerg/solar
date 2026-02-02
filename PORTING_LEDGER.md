# Solidity -> Solar Porting Ledger

This ledger tracks candidate Solidity semantic tests and their porting status into the Solar codegen harness.

Conventions:
- Status: `planned` | `in-progress` | `ported` | `skipped`
- Risk: `low` | `medium` | `high`
- Notes should capture deviations from Solidity expectations or Solar limitations.

## Phase 1 (Core Semantics)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/arithmetics/checked_add_v2.sol | arithmetics | planned | medium | testdata/semantic/arithmetics/checked_add_v2 | Overflow behavior may differ; confirm Solar semantics before asserting reverts |
| test/libsolidity/semanticTests/arithmetics/unchecked_div_by_zero.sol | arithmetics | planned | medium | testdata/semantic/arithmetics/unchecked_div_by_zero | Decide expected behavior for division by zero |
| test/libsolidity/semanticTests/storage/packed_storage_structs_uint.sol | storage | planned | low | testdata/semantic/storage/packed_storage_structs_uint | Good storage packing correctness test |
| test/libsolidity/semanticTests/storage/simple_accessor.sol | storage | planned | low | testdata/semantic/storage/simple_accessor | Getter correctness |
| test/libsolidity/semanticTests/functionCall/external_call.sol | functionCall | planned | medium | testdata/semantic/functionCall/external_call | Requires external call support |
| test/libsolidity/semanticTests/functionCall/multiple_return_values.sol | functionCall | planned | low | testdata/semantic/functionCall/multiple_return_values | Multiple returns |
| test/libsolidity/semanticTests/constructor/state_variable_initialization.sol | constructor | planned | low | testdata/semantic/constructor/state_variable_initialization | Initialization correctness |
| test/libsolidity/semanticTests/reverts/revert.sol | reverts | planned | medium | testdata/semantic/reverts/revert | Revert behavior; ensure expectations match Solar |
| test/libsolidity/semanticTests/abiEncodeDecode/abi_decode_simple.sol | abiEncodeDecode | planned | medium | testdata/semantic/abiEncodeDecode/abi_decode_simple | ABI decoder parity risk |

## Phase 2 (External Interactions)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/events/event_no_arguments.sol | events | planned | medium | testdata/semantic/events/event_no_arguments | Event support required |
| test/libsolidity/semanticTests/events/event_indexed_mixed.sol | events | planned | high | testdata/semantic/events/event_indexed_mixed | Log topic ordering and ABI encoding |
| test/libsolidity/semanticTests/inheritance/* | inheritance | planned | medium | testdata/semantic/inheritance/ | Requires dispatch correctness |
| test/libsolidity/semanticTests/libraries/* | libraries | planned | medium | testdata/semantic/libraries/ | Library linking / delegatecall |
| test/libsolidity/semanticTests/modifiers/* | modifiers | planned | medium | testdata/semantic/modifiers/ | Execution order |
| test/libsolidity/semanticTests/receive/* | receive | planned | medium | testdata/semantic/receive/ | Fallback / receive routing |

## Phase 3 (ABI + Edge Cases)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/abiEncodeDecode/* | abiEncodeDecode | planned | high | testdata/semantic/abiEncodeDecode/ | Expand to dynamic arrays, tuples |
| test/libsolidity/semanticTests/revertStrings/* | revertStrings | planned | high | testdata/semantic/revertStrings/ | Strict revert data matching |
| test/libsolidity/semanticTests/multiSource/* | multiSource | planned | medium | testdata/semantic/multiSource/ | Requires multi-file setup |

## Skips (EVM-Version-Specific or Out of Scope)

| Solidity Test Path | Reason |
| --- | --- |
| test/libsolidity/semanticTests/shanghai/* | EVM-version specific; avoid until EVM version is pinned |
| test/libsolidity/semanticTests/eof/* | EOF-specific behavior; not yet targeted |
| test/libsolidity/semanticTests/viaYul/* | Pipeline-specific (via Yul) |
| test/libsolidity/semanticTests/optimizer/* | Optimization-specific |
| test/externalTests/* | Non-deterministic / heavy integration |

