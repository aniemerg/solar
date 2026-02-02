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
| test/libsolidity/semanticTests/storage/packed_storage_structs_uint.sol | storage | ported | low | crates/codegen/testdata/storage/PackedStorageStructsUint | Ported to storage category |
| test/libsolidity/semanticTests/storage/simple_accessor.sol | storage | ported | low | crates/codegen/testdata/storage/SimpleAccessor | Getter correctness |
| test/libsolidity/semanticTests/storage/mapping_state.sol | storage | ported | medium | crates/codegen/testdata/storage/MappingState | Mapping state + control flow |
| test/libsolidity/semanticTests/array/array_storage_index_access.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayStorageIndexAccess | Dynamic array index + length mutations |
| test/libsolidity/semanticTests/array/array_storage_push_pop.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayStoragePushPop | Dynamic array push/pop |
| test/libsolidity/semanticTests/array/array_storage_length_access.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayStorageLengthAccess | Dynamic array length access |
| test/libsolidity/semanticTests/array/array_memory_index_access.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayMemoryIndexAccess | Memory array access + bounds |
| test/libsolidity/semanticTests/functionCall/external_call.sol | functionCall | ported | medium | crates/codegen/testdata/calls/ExternalCall | Requires external call support |
| test/libsolidity/semanticTests/functionCall/multiple_return_values.sol | functionCall | ported | low | crates/codegen/testdata/calls/MultipleReturnValues | Multiple returns |
| test/libsolidity/semanticTests/functionCall/calling_other_functions.sol | functionCall | ported | low | crates/codegen/testdata/control-flow/CollatzCalls | Internal calls + loops |
| test/libsolidity/semanticTests/constructor/state_variable_initialization.sol | constructor | ported | low | crates/codegen/testdata/constructor/StateVariableInitialization | Initialization correctness |
| test/libsolidity/semanticTests/reverts/revert.sol | reverts | ported | medium | crates/codegen/testdata/reverts/RevertBasics | Revert behavior; ensure expectations match Solar |
| test/libsolidity/semanticTests/abiEncodeDecode/abi_decode_simple.sol | abiEncodeDecode | ported | medium | crates/codegen/testdata/abi-encode-decode/AbiDecodeSimple | ABI decoder parity risk |
| test/libsolidity/semanticTests/abiEncodeDecode/abi_encode_with_selector.sol | abiEncodeDecode | ported | medium | crates/codegen/testdata/abi-encode-decode/AbiEncodeWithSelector | Checks selector prefix and equivalence |
| test/libsolidity/semanticTests/abiEncodeDecode/abi_decode_simple_storage.sol | abiEncodeDecode | ported | medium | crates/codegen/testdata/abi-encode-decode/AbiDecodeSimpleStorage | ABI decode from storage |

## Phase 2 (External Interactions)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/events/event_no_arguments.sol | events | ported | medium | crates/codegen/testdata/events/EventNoArguments | Event support required |
| test/libsolidity/semanticTests/events/event_indexed_mixed.sol | events | ported | high | crates/codegen/testdata/events/EventIndexedMixed | Log topic ordering and ABI encoding |
| test/libsolidity/semanticTests/events/event_string.sol | events | ported | medium | crates/codegen/testdata/events/EventString | Dynamic data in log |
| test/libsolidity/semanticTests/inheritance/inherited_function.sol | inheritance | ported | medium | crates/codegen/testdata/inheritance/InheritedFunction | Uses `A.f()` base call in derived |
| test/libsolidity/semanticTests/libraries/* | libraries | planned | medium | testdata/semantic/libraries/ | Library linking / delegatecall |
| test/libsolidity/semanticTests/modifiers/function_modifier.sol | modifiers | ported | medium | crates/codegen/testdata/modifiers/FunctionModifier | `msg.value`-gated modifier |
| test/libsolidity/semanticTests/receive/empty_calldata_calls_receive.sol | receive | ported | medium | crates/codegen/testdata/receive/EmptyCalldataCallsReceive | Empty calldata hits receive |

## Phase 3 (ABI + Edge Cases)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/abiEncodeDecode/* | abiEncodeDecode | planned | high | testdata/semantic/abiEncodeDecode/ | Expand to dynamic arrays, tuples |
| test/libsolidity/semanticTests/revertStrings/* | revertStrings | planned | high | testdata/semantic/revertStrings/ | Strict revert data matching |
| test/libsolidity/semanticTests/multiSource/* | multiSource | planned | medium | testdata/semantic/multiSource/ | Requires multi-file setup |

## Strings (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/strings/empty_string.sol | strings | ported | low | crates/codegen/testdata/strings/EmptyString | Empty string returns |
| test/libsolidity/semanticTests/strings/return_string.sol | strings | ported | medium | crates/codegen/testdata/strings/ReturnString | Storage -> memory string returns |
| test/libsolidity/semanticTests/strings/constant_string_literal.sol | strings | ported | medium | crates/codegen/testdata/strings/ConstantStringLiteral | Constant bytes32 + string literals |

## Libraries (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/libraries/internal_library_function.sol | libraries | ported | medium | crates/codegen/testdata/libraries/InternalLibraryFunction | Internal library function inlined |

## Skips (EVM-Version-Specific or Out of Scope)

| Solidity Test Path | Reason |
| --- | --- |
| test/libsolidity/semanticTests/shanghai/* | EVM-version specific; avoid until EVM version is pinned |
| test/libsolidity/semanticTests/eof/* | EOF-specific behavior; not yet targeted |
| test/libsolidity/semanticTests/viaYul/* | Pipeline-specific (via Yul) |
| test/libsolidity/semanticTests/optimizer/* | Optimization-specific |
| test/externalTests/* | Non-deterministic / heavy integration |
