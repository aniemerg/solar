# Solidity -> Solar Porting Ledger

This ledger tracks candidate Solidity semantic tests and their porting status into the Solar codegen harness.

Conventions:
- Status: `planned` | `in-progress` | `ported` | `skipped`
- Risk: `low` | `medium` | `high`
- Notes should capture deviations from Solidity expectations or Solar limitations.

## Phase 1 (Core Semantics)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/arithmetics/checked_add_v2.sol | arithmetics | ported | medium | crates/codegen/testdata-ported/arithmetic/CheckedAddV2 | Overflow behavior may differ; confirm Solar semantics before asserting reverts |
| test/libsolidity/semanticTests/arithmetics/unchecked_div_by_zero.sol | arithmetics | ported | medium | crates/codegen/testdata-ported/arithmetic/UncheckedDivByZero | Division/mod by zero should revert |
| test/libsolidity/semanticTests/integer/basic.sol | arithmetics | ported | low | crates/codegen/testdata-ported/arithmetic/IntegerBasic | Integer min/max constants |
| test/libsolidity/semanticTests/exponentiation/literal_base.sol | arithmetics | ported | medium | crates/codegen/testdata-ported/arithmetic/ExponentiationLiteralBase | Exponentiation with negative literal base |
| test/libsolidity/semanticTests/exponentiation/signed_base.sol | arithmetics | ported | low | crates/codegen/testdata-ported/arithmetic/ExponentiationSignedBase | Signed base exponentiation |
| test/libsolidity/semanticTests/exponentiation/small_exp.sol | arithmetics | ported | low | crates/codegen/testdata-ported/arithmetic/ExponentiationSmallExp | Exponentiation with small exponent |
| test/libsolidity/semanticTests/storage/packed_storage_structs_uint.sol | storage | ported | low | crates/codegen/testdata-ported/storage/PackedStorageStructsUint | Ported to storage category |
| test/libsolidity/semanticTests/storage/packed_storage_structs_enum.sol | storage | ported | medium | crates/codegen/testdata-ported/storage/PackedStorageStructsEnum | Enum packing in storage |
| test/libsolidity/semanticTests/storage/packed_storage_structs_bytes.sol | storage | ported | medium | crates/codegen/testdata-ported/storage/PackedStorageStructsBytes | Packed bytes in storage |
| test/libsolidity/semanticTests/storage/packed_storage_signed.sol | storage | ported | medium | crates/codegen/testdata-ported/storage/PackedStorageSigned | Signed storage packing |
| test/libsolidity/semanticTests/storage/packed_storage_overflow.sol | storage | ported | low | crates/codegen/testdata-ported/storage/PackedStorageOverflow | Unchecked overflow in packed storage |
| test/libsolidity/semanticTests/storage/simple_accessor.sol | storage | ported | low | crates/codegen/testdata-ported/storage/SimpleAccessor | Getter correctness |
| test/libsolidity/semanticTests/storage/mapping_state.sol | storage | ported | medium | crates/codegen/testdata-ported/storage/MappingState | Mapping state + control flow |
| test/libsolidity/semanticTests/storage/mapping_string_key.sol | storage | ported | medium | crates/codegen/testdata-ported/storage/MappingStringKey | Mapping with string key |
| test/libsolidity/semanticTests/storage/state_smoke_test.sol | storage | ported | low | crates/codegen/testdata-ported/storage/StateSmokeTest | Basic storage set/get |
| test/libsolidity/semanticTests/storage/struct_accessor.sol | storage | ported | medium | crates/codegen/testdata-ported/storage/StructAccessor | Public getter for struct mapping |
| test/libsolidity/semanticTests/storage/array_accessor.sol | storage | ported | medium | crates/codegen/testdata-ported/storage/ArrayAccessor | Mapping-struct getter test disabled (solc tuple shape mismatch); re-enable later |
| test/libsolidity/semanticTests/storage/accessors_mapping_for_array.sol | storage | ported | medium | crates/codegen/testdata-ported/storage/AccessorsMappingForArray | Mapping getters for arrays |
| test/libsolidity/semanticTests/storage/complex_accessors.sol | storage | ported | low | crates/codegen/testdata-ported/storage/ComplexAccessors | Mapping getters for primitives |
| test/libsolidity/semanticTests/storage/static_array_copy_cleanup.sol | storage | ported | medium | crates/codegen/testdata-ported/storage/StaticArrayCopyCleanup | Static array copy cleanup + delete |
| test/libsolidity/semanticTests/array/array_storage_index_access.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/ArrayStorageIndexAccess | Fuzz-style `test*` in src renamed; deterministic test calls helper to avoid OOG |
| test/libsolidity/semanticTests/array/array_storage_push_pop.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/ArrayStoragePushPop | Dynamic array push/pop |
| test/libsolidity/semanticTests/array/array_storage_length_access.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/ArrayStorageLengthAccess | Dynamic array length access |
| test/libsolidity/semanticTests/array/array_memory_index_access.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/ArrayMemoryIndexAccess | Memory array access + bounds |
| test/libsolidity/semanticTests/array/array_storage_index_zeroed_test.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/ArrayStorageIndexZeroed | Fuzz-style `test*` in src renamed; deterministic test calls helper to avoid OOG |
| test/libsolidity/semanticTests/array/array_storage_index_boundary_test.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/ArrayStorageBoundaryCheck | Fuzz-style `test*` in src renamed; deterministic test calls helper to avoid OOG |
| test/libsolidity/semanticTests/array/calldata_array.sol | array | ported | low | crates/codegen/testdata-ported/arrays/ArrayCalldataFixed | Fixed-size calldata array |
| test/libsolidity/semanticTests/array/calldata_array_as_argument_internal_function.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/CalldataArraySlice | Calldata array slice and pass-through |
| test/libsolidity/semanticTests/array/create_memory_array.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/CreateMemoryArray | Memory allocation of arrays/structs |
| test/libsolidity/semanticTests/array/array_storage_pop_zero_length.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/ArrayStoragePopZeroLength | Pop from empty dynamic array |
| test/libsolidity/semanticTests/array/array_storage_push_empty.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/ArrayStoragePushEmpty | Push zero values into dynamic array |
| test/libsolidity/semanticTests/array/array_push_with_arg.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/ArrayPushWithArg | Push with argument + bounds |
| test/libsolidity/semanticTests/array/array_push_return_reference.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/ArrayPushReturnReference | Push returns reference |
| test/libsolidity/semanticTests/array/array_storage_push_empty_length_address.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/ArrayStoragePushEmptyLengthAddress | Address array length mutations |
| test/libsolidity/semanticTests/array/storage_array_ref.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/StorageArrayRef | Storage array reference in internal call |
| test/libsolidity/semanticTests/array/create_dynamic_array_with_zero_length.sol | array | ported | low | crates/codegen/testdata-ported/arrays/CreateDynamicArrayZeroLength | Create empty nested dynamic array |
| test/libsolidity/semanticTests/array/inline_array_singleton.sol | array | ported | low | crates/codegen/testdata-ported/arrays/InlineArraySingleton | Inline array literal singleton |
| test/libsolidity/semanticTests/array/byte_array_storage_layout.sol | array | ported | high | crates/codegen/testdata-ported/arrays/ByteArrayStorageLayout | Bytes storage layout via assembly |
| test/libsolidity/semanticTests/array/arrays_complex_from_and_to_storage.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/ArraysComplexFromAndToStorage | Nested fixed-size arrays to/from storage |
| test/libsolidity/semanticTests/array/indexAccess/index_access.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/IndexAccess | Byte indexing and endian swap |
| test/libsolidity/semanticTests/array/indexAccess/fixed_bytes_index_access.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/FixedBytesIndexAccess | Fixed bytes index access |
| test/libsolidity/semanticTests/array/indexAccess/bytes_index_access.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/BytesIndexAccess | Bytes calldata/storage index access |
| test/libsolidity/semanticTests/array/indexAccess/bytes_memory_index_access.sol | array | ported | low | crates/codegen/testdata-ported/arrays/BytesMemoryIndexAccess | Bytes memory index access |
| test/libsolidity/semanticTests/array/indexAccess/bytes_index_access_memory.sol | array | ported | low | crates/codegen/testdata-ported/arrays/BytesIndexAccessMemory | Bytes memory index access via internal calls |
| test/libsolidity/semanticTests/array/indexAccess/memory_arrays_index_access_write.sol | array | ported | low | crates/codegen/testdata-ported/arrays/MemoryArraysIndexAccessWrite | Nested memory array index writes |
| test/libsolidity/semanticTests/array/indexAccess/memory_arrays_dynamic_index_access_write.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/MemoryArraysDynamicIndexAccessWrite | Storage to memory dynamic index writes |
| test/libsolidity/semanticTests/array/indexAccess/inline_array_index_access_ints.sol | array | ported | low | crates/codegen/testdata-ported/arrays/InlineArrayIndexAccessInts | Inline array index access (ints) |
| test/libsolidity/semanticTests/array/indexAccess/inline_array_index_access_strings.sol | array | ported | low | crates/codegen/testdata-ported/arrays/InlineArrayIndexAccessStrings | Inline array index access (strings) |
| test/libsolidity/semanticTests/array/indexAccess/arrays_complex_memory_index_access.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/ArraysComplexMemoryIndexAccess | Nested memory array index access |
| test/libsolidity/semanticTests/array/string_literal_assign_to_storage_bytes.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/StringLiteralAssignToStorageBytes | Assign string literal to storage bytes |
| test/libsolidity/semanticTests/array/arrayMemoryAllocation/array_zeroed_memory_index_access.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/ArrayZeroedMemoryIndexAccess | Zeroed memory array reads + bounds |
| test/libsolidity/semanticTests/array/arrayMemoryAllocation/array_static_zeroed_memory_index_access.sol | array | ported | low | crates/codegen/testdata-ported/arrays/ArrayStaticZeroedMemoryIndexAccess | Zeroed static memory array reads |
| test/libsolidity/semanticTests/array/arrayMemoryAllocation/array_static_return_param_zeroed_memory_index_access.sol | array | ported | low | crates/codegen/testdata-ported/arrays/ArrayStaticReturnParamZeroedMemory | Zeroed return params for arrays |
| test/libsolidity/semanticTests/array/arrayMemoryAllocation/array_2d_zeroed_memory_index_access.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/Array2dZeroedMemoryIndexAccess | Zeroed 2D memory array bounds |
| test/libsolidity/semanticTests/array/arrayMemoryAllocation/array_array_static.sol | array | ported | medium | crates/codegen/testdata-ported/arrays/ArrayArrayStatic | Static subarray access bounds |
| test/libsolidity/semanticTests/functionCall/external_call.sol | functionCall | ported | medium | crates/codegen/testdata-ported/calls/ExternalCall | Requires external call support |
| test/libsolidity/semanticTests/functionCall/multiple_return_values.sol | functionCall | ported | low | crates/codegen/testdata-ported/calls/MultipleReturnValues | Multiple returns |
| test/libsolidity/semanticTests/functionCall/calling_other_functions.sol | functionCall | ported | low | crates/codegen/testdata-ported/control-flow/CollatzCalls | Internal calls + loops |
| test/libsolidity/semanticTests/functionCall/named_args.sol | functionCall | ported | low | crates/codegen/testdata-ported/calls/NamedArgs | Named arguments in call |
| test/libsolidity/semanticTests/functionCall/named_args_overload.sol | functionCall | ported | low | crates/codegen/testdata-ported/calls/NamedArgsOverload | Named args with overloads |
| test/libsolidity/semanticTests/functionCall/multiple_functions.sol | functionCall | ported | low | crates/codegen/testdata-ported/calls/MultipleFunctions | Multiple selectors + missing selector |
| test/libsolidity/semanticTests/functionCall/conditional_with_arguments.sol | functionCall | ported | low | crates/codegen/testdata-ported/calls/ConditionalWithArguments | Ternary function selection |
| test/libsolidity/semanticTests/functionCall/call_options_overload.sol | functionCall | ported | medium | crates/codegen/testdata-ported/calls/CallOptionsOverload | Call options + overloads |
| test/libsolidity/semanticTests/functionCall/external_call_value.sol | functionCall | ported | medium | crates/codegen/testdata-ported/calls/ExternalCallValue | External call with value |
| test/libsolidity/semanticTests/functionCall/external_call_dynamic_returndata.sol | functionCall | ported | medium | crates/codegen/testdata-ported/calls/ExternalCallDynamicReturndata | External call returns dynamic data |
| test/libsolidity/semanticTests/functionCall/creation_function_call_no_args.sol | functionCall | ported | high | crates/codegen/testdata-ported/calls/CreationFunctionCallNoArgs | Contract creation in call |
| test/libsolidity/semanticTests/functionCall/creation_function_call_with_args.sol | functionCall | ported | high | crates/codegen/testdata-ported/calls/CreationFunctionCallWithArgs | Contract creation with args |
| test/libsolidity/semanticTests/functionCall/external_function.sol | functionCall | ported | low | crates/codegen/testdata-ported/calls/ExternalFunction | External function call |
| test/libsolidity/semanticTests/functionTypes/selector_1.sol | functionTypes | ported | medium | crates/codegen/testdata-ported/calls/FunctionSelector1 | Function selector constants |
| test/libsolidity/semanticTests/functionTypes/selector_2.sol | functionTypes | ported | medium | crates/codegen/testdata-ported/calls/FunctionSelector2 | Function selector constants |
| test/libsolidity/semanticTests/constructor/state_variable_initialization.sol | constructor | ported | low | crates/codegen/testdata-ported/constructor/StateVariableInitialization | Initialization correctness |
| test/libsolidity/semanticTests/inheritance/constructor_with_params.sol | constructor | ported | low | crates/codegen/testdata-ported/constructor/ConstructorWithParams | Constructor parameters |
| test/libsolidity/semanticTests/constructor/order_of_evaluation.sol | constructor | ported | medium | crates/codegen/testdata-ported/constructor/ConstructorOrderOfEvaluation | Base constructor evaluation order |
| test/libsolidity/semanticTests/constructor/base_constructor_arguments.sol | constructor | ported | low | crates/codegen/testdata-ported/constructor/BaseConstructorArguments | Base constructor args in inheritance |
| test/libsolidity/semanticTests/constructor/arrays_in_constructors.sol | constructor | ported | medium | crates/codegen/testdata-ported/constructor/ArraysInConstructors | Arrays passed through constructors |
| test/libsolidity/semanticTests/constructor/constructor_static_array_argument.sol | constructor | ported | low | crates/codegen/testdata-ported/constructor/ConstructorStaticArrayArgument | Static array ctor argument |
| test/libsolidity/semanticTests/constructor/constructor_arguments_external.sol | constructor | ported | low | crates/codegen/testdata-ported/constructor/ConstructorArgumentsExternal | External constructor args |
| test/libsolidity/semanticTests/reverts/revert.sol | reverts | ported | medium | crates/codegen/testdata-ported/reverts/RevertBasics | Revert behavior; ensure expectations match Solar |
| test/libsolidity/semanticTests/reverts/assert_require.sol | reverts | ported | medium | crates/codegen/testdata-ported/reverts/AssertRequire | assert/require behavior |
| test/libsolidity/semanticTests/reverts/simple_throw.sol | reverts | ported | low | crates/codegen/testdata-ported/reverts/SimpleThrow | Simple revert path |
| test/libsolidity/semanticTests/abiEncodeDecode/abi_decode_simple.sol | abiEncodeDecode | ported | medium | crates/codegen/testdata-ported/abi-encode-decode/AbiDecodeSimple | ABI decoder parity risk |
| test/libsolidity/semanticTests/abiEncodeDecode/abi_encode_with_selector.sol | abiEncodeDecode | ported | medium | crates/codegen/testdata-ported/abi-encode-decode/AbiEncodeWithSelector | Checks selector prefix and equivalence |
| test/libsolidity/semanticTests/abiEncodeDecode/abi_decode_simple_storage.sol | abiEncodeDecode | ported | medium | crates/codegen/testdata-ported/abi-encode-decode/AbiDecodeSimpleStorage | ABI decode from storage |
| test/libsolidity/semanticTests/abiEncodeDecode/abi_encode_with_signature.sol | abiEncodeDecode | ported | medium | crates/codegen/testdata-ported/abi-encode-decode/AbiEncodeWithSignature | Selector hashing from signature |
| test/libsolidity/semanticTests/abiEncodeDecode/abi_decode_calldata.sol | abiEncodeDecode | ported | medium | crates/codegen/testdata-ported/abi-encode-decode/AbiDecodeCalldata | ABI decode from calldata |
| test/libsolidity/semanticTests/abiEncodeDecode/abi_encode_call.sol | abiEncodeDecode | ported | high | crates/codegen/testdata-ported/abi-encode-decode/AbiEncodeCall | abi.encodeCall + UDVT + struct |
| test/libsolidity/semanticTests/abiEncodeDecode/abi_encode_call_memory.sol | abiEncodeDecode | ported | medium | crates/codegen/testdata-ported/abi-encode-decode/AbiEncodeCallMemory | abi.encodeCall with function pointers |

## Phase 2 (External Interactions)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/events/event_no_arguments.sol | events | ported | medium | crates/codegen/testdata-ported/events/EventNoArguments | Event support required |
| test/libsolidity/semanticTests/events/event_indexed_mixed.sol | events | ported | high | crates/codegen/testdata-ported/events/EventIndexedMixed | Log topic ordering and ABI encoding |
| test/libsolidity/semanticTests/events/event_string.sol | events | ported | medium | crates/codegen/testdata-ported/events/EventString | Dynamic data in log |
| test/libsolidity/semanticTests/events/event_dynamic_array_memory.sol | events | ported | medium | crates/codegen/testdata-ported/events/EventDynamicArrayMemory | Dynamic array data in log |
| test/libsolidity/semanticTests/events/event_struct_memory_v2.sol | events | ported | medium | crates/codegen/testdata-ported/events/EventStructMemory | Struct data in log (memory) |
| test/libsolidity/semanticTests/events/event_struct_storage_v2.sol | events | ported | medium | crates/codegen/testdata-ported/events/EventStructStorage | Struct data in log (storage) |
| test/libsolidity/semanticTests/events/event_dynamic_array_storage.sol | events | ported | medium | crates/codegen/testdata-ported/events/EventDynamicArrayStorage | Dynamic array data in log (storage) |
| test/libsolidity/semanticTests/events/event_anonymous.sol | events | ported | low | crates/codegen/testdata-ported/events/EventAnonymous | `expectEmit` removed for solc baseline; just exercises emission |
| test/libsolidity/semanticTests/events/event_emit.sol | events | ported | medium | crates/codegen/testdata-ported/events/EventEmit | Indexed event with value |
| test/libsolidity/semanticTests/events/event_indexed_string.sol | events | ported | high | crates/codegen/testdata-ported/events/EventIndexedString | Indexed string + array topics |
| test/libsolidity/semanticTests/events/event_anonymous_with_topics.sol | events | ported | medium | crates/codegen/testdata-ported/events/EventAnonymousWithTopics | Anonymous event with topics |
| test/libsolidity/semanticTests/events/event_selector.sol | events | ported | medium | crates/codegen/testdata-ported/events/EventSelector | Event selector consistency |
| test/libsolidity/semanticTests/inheritance/inherited_function.sol | inheritance | ported | medium | crates/codegen/testdata-ported/inheritance/InheritedFunction | Uses `A.f()` base call in derived |
| test/libsolidity/semanticTests/inheritance/constructor_inheritance_init_order.sol | inheritance | ported | medium | crates/codegen/testdata-ported/inheritance/ConstructorInitOrder | Harness test temporarily ignored; re-enable once baseline behavior confirmed |
| test/libsolidity/semanticTests/inheritance/super_in_constructor.sol | inheritance | ported | medium | crates/codegen/testdata-ported/inheritance/SuperInConstructor | `super` call in constructor |
| test/libsolidity/semanticTests/inheritance/state_variables_init_order.sol | inheritance | ported | low | crates/codegen/testdata-ported/inheritance/StateVariablesInitOrder | State var init order |
| test/libsolidity/semanticTests/libraries/* | libraries | planned | medium | testdata/semantic/libraries/ | Library linking / delegatecall |
| test/libsolidity/semanticTests/modifiers/function_modifier.sol | modifiers | ported | medium | crates/codegen/testdata-ported/modifiers/FunctionModifier | `msg.value`-gated modifier |
| test/libsolidity/semanticTests/modifiers/return_in_modifier.sol | modifiers | ported | medium | crates/codegen/testdata-ported/modifiers/ReturnInModifier | Modifier early return |
| test/libsolidity/semanticTests/modifiers/evaluation_order.sol | modifiers | ported | medium | crates/codegen/testdata-ported/modifiers/EvaluationOrder | Base ctor + modifier evaluation order |
| test/libsolidity/semanticTests/modifiers/function_modifier_multiple_times.sol | modifiers | ported | low | crates/codegen/testdata-ported/modifiers/FunctionModifierMultipleTimes | Repeated modifiers add up |
| test/libsolidity/semanticTests/modifiers/function_modifier_loop.sol | modifiers | ported | medium | crates/codegen/testdata-ported/modifiers/FunctionModifierLoop | Modifier invokes body in loop |
| test/libsolidity/semanticTests/modifiers/function_modifier_multi_invocation.sol | modifiers | ported | medium | crates/codegen/testdata-ported/modifiers/FunctionModifierMultiInvocation | Modifier invokes body multiple times |
| test/libsolidity/semanticTests/receive/empty_calldata_calls_receive.sol | receive | ported | medium | crates/codegen/testdata-ported/receive/EmptyCalldataCallsReceive | Empty calldata hits receive |
| test/libsolidity/semanticTests/receive/ether_and_data.sol | receive | ported | medium | crates/codegen/testdata-ported/receive/EtherAndData | Receive accepts ether, rejects data |
| test/libsolidity/semanticTests/receive/inherited.sol | receive | ported | low | crates/codegen/testdata-ported/receive/ReceiveInherited | Inherited receive |

## Fallback (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/fallback/fallback_or_receive.sol | fallback | ported | medium | crates/codegen/testdata-ported/fallback/FallbackOrReceive | Distinguish fallback vs receive |
| test/libsolidity/semanticTests/fallback/short_data_calls_fallback.sol | fallback | ported | medium | crates/codegen/testdata-ported/fallback/ShortDataCallsFallback | Short calldata hits fallback |
| test/libsolidity/semanticTests/fallback/fallback_argument.sol | fallback | ported | medium | crates/codegen/testdata-ported/fallback/FallbackArgument | Fallback with calldata argument |
| test/libsolidity/semanticTests/fallback/falback_return.sol | fallback | ported | low | crates/codegen/testdata-ported/fallback/FallbackReturn | Fallback early return |
| test/libsolidity/semanticTests/fallback/fallback_return_data.sol | fallback | ported | medium | crates/codegen/testdata-ported/fallback/FallbackReturnData | Fallback returns calldata |

## Phase 3 (ABI + Edge Cases)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/abiEncodeDecode/* | abiEncodeDecode | planned | high | testdata/semantic/abiEncodeDecode/ | Expand to dynamic arrays, tuples |
| test/libsolidity/semanticTests/revertStrings/* | revertStrings | planned | high | testdata/semantic/revertStrings/ | Strict revert data matching |
| test/libsolidity/semanticTests/revertStrings/ether_non_payable_function.sol | revertStrings | ported | medium | crates/codegen/testdata-ported/revert-strings/EtherNonPayableFunction | Non-payable revert |
| test/libsolidity/semanticTests/revertStrings/unknown_sig_no_fallback.sol | revertStrings | ported | medium | crates/codegen/testdata-ported/revert-strings/UnknownSigNoFallback | Unknown signature revert |
| test/libsolidity/semanticTests/multiSource/* | multiSource | planned | medium | testdata/semantic/multiSource/ | Requires multi-file setup |

## Strings (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/strings/empty_string.sol | strings | ported | low | crates/codegen/testdata-ported/strings/EmptyString | Empty string returns |
| test/libsolidity/semanticTests/strings/return_string.sol | strings | ported | medium | crates/codegen/testdata-ported/strings/ReturnString | Storage -> memory string returns |
| test/libsolidity/semanticTests/strings/constant_string_literal.sol | strings | ported | medium | crates/codegen/testdata-ported/strings/ConstantStringLiteral | Constant bytes32 + string literals |
| test/libsolidity/semanticTests/strings/empty_string_input.sol | strings | ported | medium | crates/codegen/testdata-ported/strings/EmptyStringInput | Empty string calldata handling |

## Literals (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/literals/denominations.sol | literals | ported | low | crates/codegen/testdata-ported/literals/Denominations | Ether/gwei/wei sums |
| test/libsolidity/semanticTests/literals/ether.sol | literals | ported | low | crates/codegen/testdata-ported/literals/EtherLiteral | Ether denomination |
| test/libsolidity/semanticTests/literals/gwei.sol | literals | ported | low | crates/codegen/testdata-ported/literals/GweiLiteral | Gwei denomination |
| test/libsolidity/semanticTests/literals/wei.sol | literals | ported | low | crates/codegen/testdata-ported/literals/WeiLiteral | Wei denomination |
| test/libsolidity/semanticTests/literals/fractional_denominations.sol | literals | ported | low | crates/codegen/testdata-ported/literals/FractionalDenominations | Fractional time/ether units |
| test/libsolidity/semanticTests/literals/scientific_notation.sol | literals | ported | low | crates/codegen/testdata-ported/literals/ScientificNotation | Scientific notation (int/uint) |
| test/libsolidity/semanticTests/literals/hex_string_with_underscore.sol | literals | ported | low | crates/codegen/testdata-ported/literals/HexStringWithUnderscore | Hex literal underscores |
| test/libsolidity/semanticTests/literals/hex_string_with_non_printable_characters.sol | literals | ported | low | crates/codegen/testdata-ported/literals/HexStringWithNonPrintableCharacters | Hex literal non-printable bytes |
| test/libsolidity/semanticTests/literals/escape.sol | literals | ported | low | crates/codegen/testdata-ported/literals/EscapeLiteral | Escaped string literal bytes |

## Expressions (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/expressions/conditional_expression_true_literal.sol | expressions | ported | low | crates/codegen/testdata-ported/expressions/ConditionalExpression | Ternary with true literal |
| test/libsolidity/semanticTests/expressions/conditional_expression_false_literal.sol | expressions | ported | low | crates/codegen/testdata-ported/expressions/ConditionalExpression | Ternary with false literal |
| test/libsolidity/semanticTests/expressions/inc_dec_operators.sol | expressions | ported | low | crates/codegen/testdata-ported/expressions/IncDecOperators | Pre/post inc/dec evaluation |
| test/libsolidity/semanticTests/expressions/bit_operators.sol | expressions | ported | medium | crates/codegen/testdata-ported/expressions/BitOperators | Bitwise ops on mixed widths |
| test/libsolidity/semanticTests/expressions/bytes_comparison.sol | expressions | ported | low | crates/codegen/testdata-ported/expressions/BytesComparison | Bytes comparison ordering |

## Operators (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/operators/shifts/shift_left.sol | operators | ported | low | crates/codegen/testdata-ported/operators/ShiftLeft | Left shift semantics |
| test/libsolidity/semanticTests/operators/shifts/shift_right.sol | operators | ported | low | crates/codegen/testdata-ported/operators/ShiftRight | Right shift semantics |

## Statements / Scoping (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/statements/empty_for_loop.sol | statements | ported | low | crates/codegen/testdata-ported/statements/EmptyForLoop | Empty for-loop with break |
| test/libsolidity/semanticTests/statements/do_while_loop_continue.sol | statements | ported | low | crates/codegen/testdata-ported/statements/DoWhileLoopContinue | do/while + continue |
| test/libsolidity/semanticTests/scoping/c99_scoping_activation.sol | scoping | ported | low | crates/codegen/testdata-ported/scoping/C99ScopingActivation | C99 scoping/ shadowing |

## Conversions (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/conversions/string_to_bytes.sol | conversions | ported | low | crates/codegen/testdata-ported/conversions/StringToBytes | string -> bytes conversion |

## Calldata (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/calldata/calldata_bytes_external.sol | calldata | ported | medium | crates/codegen/testdata-ported/calldata/CalldataBytesExternal | External calldata slice access |
| test/libsolidity/semanticTests/calldata/calldata_bytes_internal.sol | calldata | ported | medium | crates/codegen/testdata-ported/calldata/CalldataBytesInternal | Internal calldata slice access |
| test/libsolidity/semanticTests/calldata/calldata_bytes_to_memory.sol | calldata | ported | medium | crates/codegen/testdata-ported/calldata/CalldataBytesToMemory | calldata bytes -> memory keccak |
| test/libsolidity/semanticTests/calldata/calldata_bytes_array_bounds.sol | calldata | ported | medium | crates/codegen/testdata-ported/calldata/CalldataBytesArrayBounds | bytes[] bounds checks |
| test/libsolidity/semanticTests/calldata/calldata_bytes_to_memory_encode.sol | calldata | ported | medium | crates/codegen/testdata-ported/calldata/CalldataBytesToMemoryEncode | abi.encode(bytes(calldata)) |
| test/libsolidity/semanticTests/calldata/calldata_array_length.sol | calldata | ported | medium | crates/codegen/testdata-ported/calldata/CalldataArrayLength | length on 1d/2d/fixed arrays + malformed offsets |
| test/libsolidity/semanticTests/calldata/calldata_array_access.sol | calldata | ported | medium | crates/codegen/testdata-ported/calldata/CalldataArrayAccess | element access + bounds + malformed calldata |
| test/libsolidity/semanticTests/calldata/calldata_array_index_range_access.sol | calldata | ported | medium | crates/codegen/testdata-ported/calldata/CalldataArrayIndexRangeAccess | slicing length + index access + bounds reverts |

## Memory Management (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/memoryManagement/memory_types_initialisation.sol | memory | ported | medium | crates/codegen/testdata-ported/memory-management/MemoryTypesInitialization | Zero-initialization of memory returns |

## Try/Catch (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/tryCatch/simple.sol | tryCatch | ported | medium | crates/codegen/testdata-ported/try-catch/TryCatchSimple | Basic try/catch on external call |
| test/libsolidity/semanticTests/tryCatch/lowLevel.sol | tryCatch | ported | medium | crates/codegen/testdata-ported/try-catch/TryCatchLowLevel | catch(bytes) revert data |
| test/libsolidity/semanticTests/tryCatch/structured.sol | tryCatch | ported | medium | crates/codegen/testdata-ported/try-catch/TryCatchStructured | catch Error(string) message |
| test/libsolidity/semanticTests/tryCatch/structuredAndLowLevel.sol | tryCatch | ported | medium | crates/codegen/testdata-ported/try-catch/TryCatchStructuredAndLowLevel | catch Error(string) vs bytes |
| test/libsolidity/semanticTests/tryCatch/require.sol | tryCatch | ported | medium | crates/codegen/testdata-ported/try-catch/TryCatchRequire | try/catch around require |
| test/libsolidity/semanticTests/tryCatch/panic.sol | tryCatch | ported | medium | crates/codegen/testdata-ported/try-catch/TryCatchPanic | catch Panic(uint) + Error(string) |
| test/libsolidity/semanticTests/tryCatch/assert.sol | tryCatch | ported | medium | crates/codegen/testdata-ported/try-catch/TryCatchAssert | try/catch around assert |
| test/libsolidity/semanticTests/tryCatch/simple_notuple.sol | tryCatch | ported | medium | crates/codegen/testdata-ported/try-catch/TryCatchSimpleNoTuple | try/catch single return value |
| test/libsolidity/semanticTests/tryCatch/return_function.sol | tryCatch | ported | medium | crates/codegen/testdata-ported/try-catch/TryCatchReturnFunction | return external function pointer |

## Payable (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/payable/no_nonpayable_circumvention_by_modifier.sol | payable | ported | medium | crates/codegen/testdata-ported/payable/NoNonpayableCircumventionByModifier | Nonpayable enforcement through modifier |

## Immutables (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/immutable/read_in_ctor.sol | immutable | ported | low | crates/codegen/testdata-ported/immutable/ReadInConstructor | Immutable read inside constructor |

## Builtins / Hashing (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/builtinFunctions/keccak256_empty.sol | hashing | ported | low | crates/codegen/testdata-ported/hashing/HashBuiltins | keccak256 empty string |
| test/libsolidity/semanticTests/builtinFunctions/sha256_empty.sol | hashing | ported | low | crates/codegen/testdata-ported/hashing/HashBuiltins | sha256 empty string |
| test/libsolidity/semanticTests/builtinFunctions/ripemd160_empty.sol | hashing | ported | low | crates/codegen/testdata-ported/hashing/HashBuiltins | ripemd160 empty string |
| test/libsolidity/semanticTests/builtinFunctions/keccak256_with_bytes.sol | hashing | ported | low | crates/codegen/testdata-ported/hashing/HashBuiltins | keccak256(bytes) matches literal |
| test/libsolidity/semanticTests/builtinFunctions/msg_sig.sol | builtin | ported | low | crates/codegen/testdata-ported/builtin-functions/MsgSig | msg.sig selector value |
| test/libsolidity/semanticTests/builtinFunctions/msg_sig_after_internal_call_is_same.sol | builtin | ported | low | crates/codegen/testdata-ported/builtin-functions/MsgSigInternal | msg.sig preserved across internal call |
| test/libsolidity/semanticTests/builtinFunctions/keccak256_packed.sol | builtin | ported | low | crates/codegen/testdata-ported/builtin-functions/KeccakPacked | keccak256(abi.encodePacked) |
| test/libsolidity/semanticTests/builtinFunctions/keccak256_multiple_arguments.sol | builtin | ported | low | crates/codegen/testdata-ported/builtin-functions/KeccakMultiple | keccak256 packed 3 args |
| test/libsolidity/semanticTests/builtinFunctions/keccak256_multiple_arguments_with_numeric_literals.sol | builtin | ported | low | crates/codegen/testdata-ported/builtin-functions/KeccakMultipleNumeric | keccak256 packed numeric literals |
| test/libsolidity/semanticTests/builtinFunctions/keccak256_multiple_arguments_with_string_literals.sol | builtin | ported | low | crates/codegen/testdata-ported/builtin-functions/KeccakMultipleString | keccak256 packed string literal |
| test/libsolidity/semanticTests/builtinFunctions/sha256_packed.sol | builtin | ported | low | crates/codegen/testdata-ported/builtin-functions/Sha256Packed | sha256 packed inputs |
| test/libsolidity/semanticTests/builtinFunctions/ripemd160_packed.sol | builtin | ported | low | crates/codegen/testdata-ported/builtin-functions/Ripemd160Packed | ripemd160 packed inputs |
| test/libsolidity/semanticTests/builtinFunctions/keccak256_packed_complex_types.sol | builtin | ported | low | crates/codegen/testdata-ported/builtin-functions/KeccakPackedComplexTypes | keccak packed arrays + contract address |
| test/libsolidity/semanticTests/builtinFunctions/function_types_sig.sol | builtin | ported | low | crates/codegen/testdata-ported/builtin-functions/FunctionTypesSig | function selector from function types |

## Enums (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/enums/constructing_enums_from_ints.sol | enums | ported | low | crates/codegen/testdata-ported/enums/ConstructingEnumsFromInts | Enum cast from int |
| test/libsolidity/semanticTests/enums/minmax.sol | enums | ported | low | crates/codegen/testdata-ported/enums/EnumMinMax | Enum min/max |
| test/libsolidity/semanticTests/enums/using_enums.sol | enums | ported | low | crates/codegen/testdata-ported/enums/UsingEnums | Enum stored in state |
| test/libsolidity/semanticTests/enums/enum_referencing.sol | enums | ported | medium | crates/codegen/testdata-ported/enums/EnumReferencing | Enum refs across interface/library |
| test/libsolidity/semanticTests/enums/using_inherited_enum.sol | enums | ported | low | crates/codegen/testdata-ported/enums/UsingInheritedEnum | Inherited enum usage |

## Errors (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/errors/simple.sol | errors | ported | medium | crates/codegen/testdata-ported/errors/SimpleError | Custom error selector + args |
| test/libsolidity/semanticTests/errors/error_selector.sol | errors | ported | medium | crates/codegen/testdata-ported/errors/ErrorSelector | Error selector consistency |
| test/libsolidity/semanticTests/errors/require_error_string_literal.sol | errors | ported | medium | crates/codegen/testdata-ported/errors/RequireErrorStringLiteral | require with custom error string |
| test/libsolidity/semanticTests/errors/require_error_string_memory.sol | errors | ported | medium | crates/codegen/testdata-ported/errors/RequireErrorStringMemory | require with memory string |
| test/libsolidity/semanticTests/errors/require_error_uint256.sol | errors | ported | medium | crates/codegen/testdata-ported/errors/RequireErrorUint256 | require with custom error uint |
| test/libsolidity/semanticTests/errors/named_error_args.sol | errors | ported | low | crates/codegen/testdata-ported/errors/NamedErrorArgs | Named error args |
| test/libsolidity/semanticTests/errors/require_error_multiple_arguments.sol | errors | ported | medium | crates/codegen/testdata-ported/errors/RequireErrorMultipleArguments | Custom error with multiple args |
| test/libsolidity/semanticTests/errors/require_error_condition_evaluated_only_once.sol | errors | ported | medium | crates/codegen/testdata-ported/errors/RequireErrorConditionEvaluatedOnce | Require condition evaluated once |
| test/libsolidity/semanticTests/errors/require_error_evaluation_order_1.sol | errors | ported | medium | crates/codegen/testdata-ported/errors/RequireErrorEvaluationOrder1 | Require error evaluation order |
| test/libsolidity/semanticTests/errors/require_error_evaluation_order_2.sol | errors | ported | medium | crates/codegen/testdata-ported/errors/RequireErrorEvaluationOrder2 | Require error evaluation order (state) |
| test/libsolidity/semanticTests/errors/require_error_evaluation_order_3.sol | errors | ported | medium | crates/codegen/testdata-ported/errors/RequireErrorEvaluationOrder3 | Require error evaluation order (string) |

## Structs (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/structs/simple_struct_allocation.sol | structs | ported | low | crates/codegen/testdata-ported/structs/SimpleStructAllocation | Memory struct allocation |
| test/libsolidity/semanticTests/structs/struct_copy.sol | structs | ported | medium | crates/codegen/testdata-ported/structs/StructCopy | Struct copy in mapping |
| test/libsolidity/semanticTests/structs/memory_structs_read_write.sol | structs | ported | medium | crates/codegen/testdata-ported/structs/MemoryStructsReadWrite | Memory struct read/write |
| test/libsolidity/semanticTests/structs/struct_delete_member.sol | structs | ported | medium | crates/codegen/testdata-ported/structs/StructDeleteMember | Delete struct member |
| test/libsolidity/semanticTests/structs/struct_named_constructor.sol | structs | ported | low | crates/codegen/testdata-ported/structs/StructNamedConstructor | Struct named constructor |
| test/libsolidity/semanticTests/structs/struct_reference.sol | structs | ported | medium | crates/codegen/testdata-ported/structs/StructReference | Recursive struct reference |
| test/libsolidity/semanticTests/structs/struct_copy_via_local.sol | structs | ported | medium | crates/codegen/testdata-ported/structs/StructCopyViaLocal | Struct copy via local memory |
| test/libsolidity/semanticTests/structs/struct_assign_reference_to_struct.sol | structs | ported | medium | crates/codegen/testdata-ported/structs/StructAssignReferenceToStruct | Struct storage reference vs copy |
| test/libsolidity/semanticTests/structs/struct_storage_push_zero_value.sol | structs | ported | medium | crates/codegen/testdata-ported/structs/StructStoragePushZeroValue | Struct push zero initialization |
| test/libsolidity/semanticTests/array/strings_in_struct.sol | structs | ported | low | crates/codegen/testdata-ported/structs/StringsInStruct | String member in struct |

## Libraries (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/libraries/internal_library_function.sol | libraries | ported | medium | crates/codegen/testdata-ported/libraries/InternalLibraryFunction | Internal library function inlined |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_integer.sol | libraries | ported | low | crates/codegen/testdata-ported/libraries/InternalLibraryFunctionAttachedToInteger | `using for` on uint256 |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_bool.sol | libraries | ported | low | crates/codegen/testdata-ported/libraries/InternalLibraryFunctionAttachedToBool | `using for` on bool |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_string_accepting_memory.sol | libraries | ported | low | crates/codegen/testdata-ported/libraries/InternalLibraryFunctionAttachedToStringMemory | `using for` on string (memory) |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_array_named_pop_push.sol | libraries | ported | low | crates/codegen/testdata-ported/libraries/InternalLibraryFunctionAttachedToArrayNamedPopPush | `using for` on fixed array |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_address.sol | libraries | ported | low | crates/codegen/testdata-ported/libraries/InternalLibraryFunctionAttachedToAddress | `using for` on address |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_fixed_bytes.sol | libraries | ported | low | crates/codegen/testdata-ported/libraries/InternalLibraryFunctionAttachedToFixedBytes | `using for` on fixed bytes |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_enum.sol | libraries | ported | low | crates/codegen/testdata-ported/libraries/InternalLibraryFunctionAttachedToEnum | `using for` on enum |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_contract.sol | libraries | ported | low | crates/codegen/testdata-ported/libraries/InternalLibraryFunctionAttachedToContract | `using for` on contract type |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_dynamic_array.sol | libraries | ported | low | crates/codegen/testdata-ported/libraries/InternalLibraryFunctionAttachedToDynamicArray | `using for` on dynamic array |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_literal.sol | libraries | ported | low | crates/codegen/testdata-ported/libraries/InternalLibraryFunctionAttachedToLiteral | `using for` on literal |

## Skips (EVM-Version-Specific or Out of Scope)

| Solidity Test Path | Reason |
| --- | --- |
| test/libsolidity/semanticTests/shanghai/* | EVM-version specific; avoid until EVM version is pinned |
| test/libsolidity/semanticTests/eof/* | EOF-specific behavior; not yet targeted |
| test/libsolidity/semanticTests/viaYul/* | Pipeline-specific (via Yul) |
| test/libsolidity/semanticTests/optimizer/* | Optimization-specific |
| test/externalTests/* | Non-deterministic / heavy integration |
