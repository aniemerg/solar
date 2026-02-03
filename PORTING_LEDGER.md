# Solidity -> Solar Porting Ledger

This ledger tracks candidate Solidity semantic tests and their porting status into the Solar codegen harness.

Conventions:
- Status: `planned` | `in-progress` | `ported` | `skipped`
- Risk: `low` | `medium` | `high`
- Notes should capture deviations from Solidity expectations or Solar limitations.

## Phase 1 (Core Semantics)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/arithmetics/checked_add_v2.sol | arithmetics | ported | medium | crates/codegen/testdata/arithmetic/CheckedAddV2 | Overflow behavior may differ; confirm Solar semantics before asserting reverts |
| test/libsolidity/semanticTests/arithmetics/unchecked_div_by_zero.sol | arithmetics | ported | medium | crates/codegen/testdata/arithmetic/UncheckedDivByZero | Division/mod by zero should revert |
| test/libsolidity/semanticTests/storage/packed_storage_structs_uint.sol | storage | ported | low | crates/codegen/testdata/storage/PackedStorageStructsUint | Ported to storage category |
| test/libsolidity/semanticTests/storage/packed_storage_structs_enum.sol | storage | ported | medium | crates/codegen/testdata/storage/PackedStorageStructsEnum | Enum packing in storage |
| test/libsolidity/semanticTests/storage/packed_storage_structs_bytes.sol | storage | ported | medium | crates/codegen/testdata/storage/PackedStorageStructsBytes | Packed bytes in storage |
| test/libsolidity/semanticTests/storage/packed_storage_signed.sol | storage | ported | medium | crates/codegen/testdata/storage/PackedStorageSigned | Signed storage packing |
| test/libsolidity/semanticTests/storage/packed_storage_overflow.sol | storage | ported | low | crates/codegen/testdata/storage/PackedStorageOverflow | Unchecked overflow in packed storage |
| test/libsolidity/semanticTests/storage/simple_accessor.sol | storage | ported | low | crates/codegen/testdata/storage/SimpleAccessor | Getter correctness |
| test/libsolidity/semanticTests/storage/mapping_state.sol | storage | ported | medium | crates/codegen/testdata/storage/MappingState | Mapping state + control flow |
| test/libsolidity/semanticTests/storage/mapping_string_key.sol | storage | ported | medium | crates/codegen/testdata/storage/MappingStringKey | Mapping with string key |
| test/libsolidity/semanticTests/storage/state_smoke_test.sol | storage | ported | low | crates/codegen/testdata/storage/StateSmokeTest | Basic storage set/get |
| test/libsolidity/semanticTests/storage/struct_accessor.sol | storage | ported | medium | crates/codegen/testdata/storage/StructAccessor | Public getter for struct mapping |
| test/libsolidity/semanticTests/storage/array_accessor.sol | storage | ported | medium | crates/codegen/testdata/storage/ArrayAccessor | Public getters for arrays + mappings |
| test/libsolidity/semanticTests/array/array_storage_index_access.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayStorageIndexAccess | Dynamic array index + length mutations |
| test/libsolidity/semanticTests/array/array_storage_push_pop.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayStoragePushPop | Dynamic array push/pop |
| test/libsolidity/semanticTests/array/array_storage_length_access.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayStorageLengthAccess | Dynamic array length access |
| test/libsolidity/semanticTests/array/array_memory_index_access.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayMemoryIndexAccess | Memory array access + bounds |
| test/libsolidity/semanticTests/array/array_storage_index_zeroed_test.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayStorageIndexZeroed | Storage slot zeroing after resize |
| test/libsolidity/semanticTests/array/array_storage_index_boundary_test.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayStorageBoundaryCheck | Storage bounds checks |
| test/libsolidity/semanticTests/array/calldata_array.sol | array | ported | low | crates/codegen/testdata/arrays/ArrayCalldataFixed | Fixed-size calldata array |
| test/libsolidity/semanticTests/array/calldata_array_as_argument_internal_function.sol | array | ported | medium | crates/codegen/testdata/arrays/CalldataArraySlice | Calldata array slice and pass-through |
| test/libsolidity/semanticTests/array/create_memory_array.sol | array | ported | medium | crates/codegen/testdata/arrays/CreateMemoryArray | Memory allocation of arrays/structs |
| test/libsolidity/semanticTests/array/array_storage_pop_zero_length.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayStoragePopZeroLength | Pop from empty dynamic array |
| test/libsolidity/semanticTests/array/array_storage_push_empty.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayStoragePushEmpty | Push zero values into dynamic array |
| test/libsolidity/semanticTests/functionCall/external_call.sol | functionCall | ported | medium | crates/codegen/testdata/calls/ExternalCall | Requires external call support |
| test/libsolidity/semanticTests/functionCall/multiple_return_values.sol | functionCall | ported | low | crates/codegen/testdata/calls/MultipleReturnValues | Multiple returns |
| test/libsolidity/semanticTests/functionCall/calling_other_functions.sol | functionCall | ported | low | crates/codegen/testdata/control-flow/CollatzCalls | Internal calls + loops |
| test/libsolidity/semanticTests/functionCall/named_args.sol | functionCall | ported | low | crates/codegen/testdata/calls/NamedArgs | Named arguments in call |
| test/libsolidity/semanticTests/functionCall/named_args_overload.sol | functionCall | ported | low | crates/codegen/testdata/calls/NamedArgsOverload | Named args with overloads |
| test/libsolidity/semanticTests/functionCall/multiple_functions.sol | functionCall | ported | low | crates/codegen/testdata/calls/MultipleFunctions | Multiple selectors + missing selector |
| test/libsolidity/semanticTests/functionCall/conditional_with_arguments.sol | functionCall | ported | low | crates/codegen/testdata/calls/ConditionalWithArguments | Ternary function selection |
| test/libsolidity/semanticTests/functionCall/call_options_overload.sol | functionCall | ported | medium | crates/codegen/testdata/calls/CallOptionsOverload | Call options + overloads |
| test/libsolidity/semanticTests/functionCall/external_call_value.sol | functionCall | ported | medium | crates/codegen/testdata/calls/ExternalCallValue | External call with value |
| test/libsolidity/semanticTests/functionCall/external_call_dynamic_returndata.sol | functionCall | ported | medium | crates/codegen/testdata/calls/ExternalCallDynamicReturndata | External call returns dynamic data |
| test/libsolidity/semanticTests/functionCall/creation_function_call_no_args.sol | functionCall | ported | high | crates/codegen/testdata/calls/CreationFunctionCallNoArgs | Contract creation in call |
| test/libsolidity/semanticTests/functionCall/creation_function_call_with_args.sol | functionCall | ported | high | crates/codegen/testdata/calls/CreationFunctionCallWithArgs | Contract creation with args |
| test/libsolidity/semanticTests/functionCall/external_function.sol | functionCall | ported | low | crates/codegen/testdata/calls/ExternalFunction | External function call |
| test/libsolidity/semanticTests/constructor/state_variable_initialization.sol | constructor | ported | low | crates/codegen/testdata/constructor/StateVariableInitialization | Initialization correctness |
| test/libsolidity/semanticTests/inheritance/constructor_with_params.sol | constructor | ported | low | crates/codegen/testdata/constructor/ConstructorWithParams | Constructor parameters |
| test/libsolidity/semanticTests/reverts/revert.sol | reverts | ported | medium | crates/codegen/testdata/reverts/RevertBasics | Revert behavior; ensure expectations match Solar |
| test/libsolidity/semanticTests/reverts/assert_require.sol | reverts | ported | medium | crates/codegen/testdata/reverts/AssertRequire | assert/require behavior |
| test/libsolidity/semanticTests/reverts/simple_throw.sol | reverts | ported | low | crates/codegen/testdata/reverts/SimpleThrow | Simple revert path |
| test/libsolidity/semanticTests/abiEncodeDecode/abi_decode_simple.sol | abiEncodeDecode | ported | medium | crates/codegen/testdata/abi-encode-decode/AbiDecodeSimple | ABI decoder parity risk |
| test/libsolidity/semanticTests/abiEncodeDecode/abi_encode_with_selector.sol | abiEncodeDecode | ported | medium | crates/codegen/testdata/abi-encode-decode/AbiEncodeWithSelector | Checks selector prefix and equivalence |
| test/libsolidity/semanticTests/abiEncodeDecode/abi_decode_simple_storage.sol | abiEncodeDecode | ported | medium | crates/codegen/testdata/abi-encode-decode/AbiDecodeSimpleStorage | ABI decode from storage |
| test/libsolidity/semanticTests/abiEncodeDecode/abi_encode_with_signature.sol | abiEncodeDecode | ported | medium | crates/codegen/testdata/abi-encode-decode/AbiEncodeWithSignature | Selector hashing from signature |
| test/libsolidity/semanticTests/abiEncodeDecode/abi_decode_calldata.sol | abiEncodeDecode | ported | medium | crates/codegen/testdata/abi-encode-decode/AbiDecodeCalldata | ABI decode from calldata |
| test/libsolidity/semanticTests/abiEncodeDecode/abi_encode_call.sol | abiEncodeDecode | ported | high | crates/codegen/testdata/abi-encode-decode/AbiEncodeCall | abi.encodeCall + UDVT + struct |
| test/libsolidity/semanticTests/abiEncodeDecode/abi_encode_call_memory.sol | abiEncodeDecode | ported | medium | crates/codegen/testdata/abi-encode-decode/AbiEncodeCallMemory | abi.encodeCall with function pointers |

## Phase 2 (External Interactions)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/events/event_no_arguments.sol | events | ported | medium | crates/codegen/testdata/events/EventNoArguments | Event support required |
| test/libsolidity/semanticTests/events/event_indexed_mixed.sol | events | ported | high | crates/codegen/testdata/events/EventIndexedMixed | Log topic ordering and ABI encoding |
| test/libsolidity/semanticTests/events/event_string.sol | events | ported | medium | crates/codegen/testdata/events/EventString | Dynamic data in log |
| test/libsolidity/semanticTests/events/event_dynamic_array_memory.sol | events | ported | medium | crates/codegen/testdata/events/EventDynamicArrayMemory | Dynamic array data in log |
| test/libsolidity/semanticTests/events/event_struct_memory_v2.sol | events | ported | medium | crates/codegen/testdata/events/EventStructMemory | Struct data in log (memory) |
| test/libsolidity/semanticTests/events/event_struct_storage_v2.sol | events | ported | medium | crates/codegen/testdata/events/EventStructStorage | Struct data in log (storage) |
| test/libsolidity/semanticTests/events/event_dynamic_array_storage.sol | events | ported | medium | crates/codegen/testdata/events/EventDynamicArrayStorage | Dynamic array data in log (storage) |
| test/libsolidity/semanticTests/events/event_anonymous.sol | events | ported | low | crates/codegen/testdata/events/EventAnonymous | Anonymous event |
| test/libsolidity/semanticTests/events/event_emit.sol | events | ported | medium | crates/codegen/testdata/events/EventEmit | Indexed event with value |
| test/libsolidity/semanticTests/events/event_indexed_string.sol | events | ported | high | crates/codegen/testdata/events/EventIndexedString | Indexed string + array topics |
| test/libsolidity/semanticTests/inheritance/inherited_function.sol | inheritance | ported | medium | crates/codegen/testdata/inheritance/InheritedFunction | Uses `A.f()` base call in derived |
| test/libsolidity/semanticTests/inheritance/constructor_inheritance_init_order.sol | inheritance | ported | medium | crates/codegen/testdata/inheritance/ConstructorInitOrder | Base constructor init order |
| test/libsolidity/semanticTests/inheritance/super_in_constructor.sol | inheritance | ported | medium | crates/codegen/testdata/inheritance/SuperInConstructor | `super` call in constructor |
| test/libsolidity/semanticTests/inheritance/state_variables_init_order.sol | inheritance | ported | low | crates/codegen/testdata/inheritance/StateVariablesInitOrder | State var init order |
| test/libsolidity/semanticTests/libraries/* | libraries | planned | medium | testdata/semantic/libraries/ | Library linking / delegatecall |
| test/libsolidity/semanticTests/modifiers/function_modifier.sol | modifiers | ported | medium | crates/codegen/testdata/modifiers/FunctionModifier | `msg.value`-gated modifier |
| test/libsolidity/semanticTests/modifiers/return_in_modifier.sol | modifiers | ported | medium | crates/codegen/testdata/modifiers/ReturnInModifier | Modifier early return |
| test/libsolidity/semanticTests/modifiers/evaluation_order.sol | modifiers | ported | medium | crates/codegen/testdata/modifiers/EvaluationOrder | Base ctor + modifier evaluation order |
| test/libsolidity/semanticTests/modifiers/function_modifier_multiple_times.sol | modifiers | ported | low | crates/codegen/testdata/modifiers/FunctionModifierMultipleTimes | Repeated modifiers add up |
| test/libsolidity/semanticTests/receive/empty_calldata_calls_receive.sol | receive | ported | medium | crates/codegen/testdata/receive/EmptyCalldataCallsReceive | Empty calldata hits receive |
| test/libsolidity/semanticTests/receive/ether_and_data.sol | receive | ported | medium | crates/codegen/testdata/receive/EtherAndData | Receive accepts ether, rejects data |
| test/libsolidity/semanticTests/receive/inherited.sol | receive | ported | low | crates/codegen/testdata/receive/ReceiveInherited | Inherited receive |

## Fallback (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/fallback/fallback_or_receive.sol | fallback | ported | medium | crates/codegen/testdata/fallback/FallbackOrReceive | Distinguish fallback vs receive |
| test/libsolidity/semanticTests/fallback/short_data_calls_fallback.sol | fallback | ported | medium | crates/codegen/testdata/fallback/ShortDataCallsFallback | Short calldata hits fallback |
| test/libsolidity/semanticTests/fallback/fallback_argument.sol | fallback | ported | medium | crates/codegen/testdata/fallback/FallbackArgument | Fallback with calldata argument |

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
| test/libsolidity/semanticTests/strings/empty_string_input.sol | strings | ported | medium | crates/codegen/testdata/strings/EmptyStringInput | Empty string calldata handling |

## Enums (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/enums/constructing_enums_from_ints.sol | enums | ported | low | crates/codegen/testdata/enums/ConstructingEnumsFromInts | Enum cast from int |
| test/libsolidity/semanticTests/enums/minmax.sol | enums | ported | low | crates/codegen/testdata/enums/EnumMinMax | Enum min/max |
| test/libsolidity/semanticTests/enums/using_enums.sol | enums | ported | low | crates/codegen/testdata/enums/UsingEnums | Enum stored in state |
| test/libsolidity/semanticTests/enums/enum_referencing.sol | enums | ported | medium | crates/codegen/testdata/enums/EnumReferencing | Enum refs across interface/library |

## Errors (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/errors/simple.sol | errors | ported | medium | crates/codegen/testdata/errors/SimpleError | Custom error selector + args |
| test/libsolidity/semanticTests/errors/error_selector.sol | errors | ported | medium | crates/codegen/testdata/errors/ErrorSelector | Error selector consistency |

## Structs (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/structs/simple_struct_allocation.sol | structs | ported | low | crates/codegen/testdata/structs/SimpleStructAllocation | Memory struct allocation |
| test/libsolidity/semanticTests/structs/struct_copy.sol | structs | ported | medium | crates/codegen/testdata/structs/StructCopy | Struct copy in mapping |
| test/libsolidity/semanticTests/structs/memory_structs_read_write.sol | structs | ported | medium | crates/codegen/testdata/structs/MemoryStructsReadWrite | Memory struct read/write |
| test/libsolidity/semanticTests/structs/struct_delete_member.sol | structs | ported | medium | crates/codegen/testdata/structs/StructDeleteMember | Delete struct member |
| test/libsolidity/semanticTests/structs/struct_named_constructor.sol | structs | ported | low | crates/codegen/testdata/structs/StructNamedConstructor | Struct named constructor |

## Libraries (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/libraries/internal_library_function.sol | libraries | ported | medium | crates/codegen/testdata/libraries/InternalLibraryFunction | Internal library function inlined |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_integer.sol | libraries | ported | low | crates/codegen/testdata/libraries/InternalLibraryFunctionAttachedToInteger | `using for` on uint256 |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_bool.sol | libraries | ported | low | crates/codegen/testdata/libraries/InternalLibraryFunctionAttachedToBool | `using for` on bool |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_string_accepting_memory.sol | libraries | ported | low | crates/codegen/testdata/libraries/InternalLibraryFunctionAttachedToStringMemory | `using for` on string (memory) |

## Skips (EVM-Version-Specific or Out of Scope)

| Solidity Test Path | Reason |
| --- | --- |
| test/libsolidity/semanticTests/shanghai/* | EVM-version specific; avoid until EVM version is pinned |
| test/libsolidity/semanticTests/eof/* | EOF-specific behavior; not yet targeted |
| test/libsolidity/semanticTests/viaYul/* | Pipeline-specific (via Yul) |
| test/libsolidity/semanticTests/optimizer/* | Optimization-specific |
| test/externalTests/* | Non-deterministic / heavy integration |
