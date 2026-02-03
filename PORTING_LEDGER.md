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
| test/libsolidity/semanticTests/integer/basic.sol | arithmetics | ported | low | crates/codegen/testdata/arithmetic/IntegerBasic | Integer min/max constants |
| test/libsolidity/semanticTests/exponentiation/literal_base.sol | arithmetics | ported | medium | crates/codegen/testdata/arithmetic/ExponentiationLiteralBase | Exponentiation with negative literal base |
| test/libsolidity/semanticTests/exponentiation/signed_base.sol | arithmetics | ported | low | crates/codegen/testdata/arithmetic/ExponentiationSignedBase | Signed base exponentiation |
| test/libsolidity/semanticTests/exponentiation/small_exp.sol | arithmetics | ported | low | crates/codegen/testdata/arithmetic/ExponentiationSmallExp | Exponentiation with small exponent |
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
| test/libsolidity/semanticTests/storage/array_accessor.sol | storage | ported | medium | crates/codegen/testdata/storage/ArrayAccessor | Mapping-struct getter test disabled (solc tuple shape mismatch); re-enable later |
| test/libsolidity/semanticTests/storage/accessors_mapping_for_array.sol | storage | ported | medium | crates/codegen/testdata/storage/AccessorsMappingForArray | Mapping getters for arrays |
| test/libsolidity/semanticTests/storage/complex_accessors.sol | storage | ported | low | crates/codegen/testdata/storage/ComplexAccessors | Mapping getters for primitives |
| test/libsolidity/semanticTests/storage/static_array_copy_cleanup.sol | storage | ported | medium | crates/codegen/testdata/storage/StaticArrayCopyCleanup | Static array copy cleanup + delete |
| test/libsolidity/semanticTests/array/array_storage_index_access.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayStorageIndexAccess | Fuzz-style `test*` in src renamed; deterministic test calls helper to avoid OOG |
| test/libsolidity/semanticTests/array/array_storage_push_pop.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayStoragePushPop | Dynamic array push/pop |
| test/libsolidity/semanticTests/array/array_storage_length_access.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayStorageLengthAccess | Dynamic array length access |
| test/libsolidity/semanticTests/array/array_memory_index_access.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayMemoryIndexAccess | Memory array access + bounds |
| test/libsolidity/semanticTests/array/array_storage_index_zeroed_test.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayStorageIndexZeroed | Fuzz-style `test*` in src renamed; deterministic test calls helper to avoid OOG |
| test/libsolidity/semanticTests/array/array_storage_index_boundary_test.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayStorageBoundaryCheck | Fuzz-style `test*` in src renamed; deterministic test calls helper to avoid OOG |
| test/libsolidity/semanticTests/array/calldata_array.sol | array | ported | low | crates/codegen/testdata/arrays/ArrayCalldataFixed | Fixed-size calldata array |
| test/libsolidity/semanticTests/array/calldata_array_as_argument_internal_function.sol | array | ported | medium | crates/codegen/testdata/arrays/CalldataArraySlice | Calldata array slice and pass-through |
| test/libsolidity/semanticTests/array/create_memory_array.sol | array | ported | medium | crates/codegen/testdata/arrays/CreateMemoryArray | Memory allocation of arrays/structs |
| test/libsolidity/semanticTests/array/array_storage_pop_zero_length.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayStoragePopZeroLength | Pop from empty dynamic array |
| test/libsolidity/semanticTests/array/array_storage_push_empty.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayStoragePushEmpty | Push zero values into dynamic array |
| test/libsolidity/semanticTests/array/array_push_with_arg.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayPushWithArg | Push with argument + bounds |
| test/libsolidity/semanticTests/array/array_push_return_reference.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayPushReturnReference | Push returns reference |
| test/libsolidity/semanticTests/array/array_storage_push_empty_length_address.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayStoragePushEmptyLengthAddress | Address array length mutations |
| test/libsolidity/semanticTests/array/storage_array_ref.sol | array | ported | medium | crates/codegen/testdata/arrays/StorageArrayRef | Storage array reference in internal call |
| test/libsolidity/semanticTests/array/create_dynamic_array_with_zero_length.sol | array | ported | low | crates/codegen/testdata/arrays/CreateDynamicArrayZeroLength | Create empty nested dynamic array |
| test/libsolidity/semanticTests/array/inline_array_singleton.sol | array | ported | low | crates/codegen/testdata/arrays/InlineArraySingleton | Inline array literal singleton |
| test/libsolidity/semanticTests/array/byte_array_storage_layout.sol | array | ported | high | crates/codegen/testdata/arrays/ByteArrayStorageLayout | Bytes storage layout via assembly |
| test/libsolidity/semanticTests/array/arrays_complex_from_and_to_storage.sol | array | ported | medium | crates/codegen/testdata/arrays/ArraysComplexFromAndToStorage | Nested fixed-size arrays to/from storage |
| test/libsolidity/semanticTests/array/indexAccess/index_access.sol | array | ported | medium | crates/codegen/testdata/arrays/IndexAccess | Byte indexing and endian swap |
| test/libsolidity/semanticTests/array/indexAccess/fixed_bytes_index_access.sol | array | ported | medium | crates/codegen/testdata/arrays/FixedBytesIndexAccess | Fixed bytes index access |
| test/libsolidity/semanticTests/array/indexAccess/bytes_index_access.sol | array | ported | medium | crates/codegen/testdata/arrays/BytesIndexAccess | Bytes calldata/storage index access |
| test/libsolidity/semanticTests/array/indexAccess/bytes_memory_index_access.sol | array | ported | low | crates/codegen/testdata/arrays/BytesMemoryIndexAccess | Bytes memory index access |
| test/libsolidity/semanticTests/array/indexAccess/bytes_index_access_memory.sol | array | ported | low | crates/codegen/testdata/arrays/BytesIndexAccessMemory | Bytes memory index access via internal calls |
| test/libsolidity/semanticTests/array/indexAccess/memory_arrays_index_access_write.sol | array | ported | low | crates/codegen/testdata/arrays/MemoryArraysIndexAccessWrite | Nested memory array index writes |
| test/libsolidity/semanticTests/array/indexAccess/memory_arrays_dynamic_index_access_write.sol | array | ported | medium | crates/codegen/testdata/arrays/MemoryArraysDynamicIndexAccessWrite | Storage to memory dynamic index writes |
| test/libsolidity/semanticTests/array/indexAccess/inline_array_index_access_ints.sol | array | ported | low | crates/codegen/testdata/arrays/InlineArrayIndexAccessInts | Inline array index access (ints) |
| test/libsolidity/semanticTests/array/indexAccess/inline_array_index_access_strings.sol | array | ported | low | crates/codegen/testdata/arrays/InlineArrayIndexAccessStrings | Inline array index access (strings) |
| test/libsolidity/semanticTests/array/indexAccess/arrays_complex_memory_index_access.sol | array | ported | medium | crates/codegen/testdata/arrays/ArraysComplexMemoryIndexAccess | Nested memory array index access |
| test/libsolidity/semanticTests/array/string_literal_assign_to_storage_bytes.sol | array | ported | medium | crates/codegen/testdata/arrays/StringLiteralAssignToStorageBytes | Assign string literal to storage bytes |
| test/libsolidity/semanticTests/array/arrayMemoryAllocation/array_zeroed_memory_index_access.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayZeroedMemoryIndexAccess | Zeroed memory array reads + bounds |
| test/libsolidity/semanticTests/array/arrayMemoryAllocation/array_static_zeroed_memory_index_access.sol | array | ported | low | crates/codegen/testdata/arrays/ArrayStaticZeroedMemoryIndexAccess | Zeroed static memory array reads |
| test/libsolidity/semanticTests/array/arrayMemoryAllocation/array_static_return_param_zeroed_memory_index_access.sol | array | ported | low | crates/codegen/testdata/arrays/ArrayStaticReturnParamZeroedMemory | Zeroed return params for arrays |
| test/libsolidity/semanticTests/array/arrayMemoryAllocation/array_2d_zeroed_memory_index_access.sol | array | ported | medium | crates/codegen/testdata/arrays/Array2dZeroedMemoryIndexAccess | Zeroed 2D memory array bounds |
| test/libsolidity/semanticTests/array/arrayMemoryAllocation/array_array_static.sol | array | ported | medium | crates/codegen/testdata/arrays/ArrayArrayStatic | Static subarray access bounds |
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
| test/libsolidity/semanticTests/functionTypes/selector_1.sol | functionTypes | ported | medium | crates/codegen/testdata/calls/FunctionSelector1 | Function selector constants |
| test/libsolidity/semanticTests/functionTypes/selector_2.sol | functionTypes | ported | medium | crates/codegen/testdata/calls/FunctionSelector2 | Function selector constants |
| test/libsolidity/semanticTests/constructor/state_variable_initialization.sol | constructor | ported | low | crates/codegen/testdata/constructor/StateVariableInitialization | Initialization correctness |
| test/libsolidity/semanticTests/inheritance/constructor_with_params.sol | constructor | ported | low | crates/codegen/testdata/constructor/ConstructorWithParams | Constructor parameters |
| test/libsolidity/semanticTests/constructor/order_of_evaluation.sol | constructor | ported | medium | crates/codegen/testdata/constructor/ConstructorOrderOfEvaluation | Base constructor evaluation order |
| test/libsolidity/semanticTests/constructor/base_constructor_arguments.sol | constructor | ported | low | crates/codegen/testdata/constructor/BaseConstructorArguments | Base constructor args in inheritance |
| test/libsolidity/semanticTests/constructor/arrays_in_constructors.sol | constructor | ported | medium | crates/codegen/testdata/constructor/ArraysInConstructors | Arrays passed through constructors |
| test/libsolidity/semanticTests/constructor/constructor_static_array_argument.sol | constructor | ported | low | crates/codegen/testdata/constructor/ConstructorStaticArrayArgument | Static array ctor argument |
| test/libsolidity/semanticTests/constructor/constructor_arguments_external.sol | constructor | ported | low | crates/codegen/testdata/constructor/ConstructorArgumentsExternal | External constructor args |
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
| test/libsolidity/semanticTests/events/event_anonymous.sol | events | ported | low | crates/codegen/testdata/events/EventAnonymous | `expectEmit` removed for solc baseline; just exercises emission |
| test/libsolidity/semanticTests/events/event_emit.sol | events | ported | medium | crates/codegen/testdata/events/EventEmit | Indexed event with value |
| test/libsolidity/semanticTests/events/event_indexed_string.sol | events | ported | high | crates/codegen/testdata/events/EventIndexedString | Indexed string + array topics |
| test/libsolidity/semanticTests/events/event_anonymous_with_topics.sol | events | ported | medium | crates/codegen/testdata/events/EventAnonymousWithTopics | Anonymous event with topics |
| test/libsolidity/semanticTests/events/event_selector.sol | events | ported | medium | crates/codegen/testdata/events/EventSelector | Event selector consistency |
| test/libsolidity/semanticTests/inheritance/inherited_function.sol | inheritance | ported | medium | crates/codegen/testdata/inheritance/InheritedFunction | Uses `A.f()` base call in derived |
| test/libsolidity/semanticTests/inheritance/constructor_inheritance_init_order.sol | inheritance | ported | medium | crates/codegen/testdata/inheritance/ConstructorInitOrder | Harness test temporarily ignored; re-enable once baseline behavior confirmed |
| test/libsolidity/semanticTests/inheritance/super_in_constructor.sol | inheritance | ported | medium | crates/codegen/testdata/inheritance/SuperInConstructor | `super` call in constructor |
| test/libsolidity/semanticTests/inheritance/state_variables_init_order.sol | inheritance | ported | low | crates/codegen/testdata/inheritance/StateVariablesInitOrder | State var init order |
| test/libsolidity/semanticTests/libraries/* | libraries | planned | medium | testdata/semantic/libraries/ | Library linking / delegatecall |
| test/libsolidity/semanticTests/modifiers/function_modifier.sol | modifiers | ported | medium | crates/codegen/testdata/modifiers/FunctionModifier | `msg.value`-gated modifier |
| test/libsolidity/semanticTests/modifiers/return_in_modifier.sol | modifiers | ported | medium | crates/codegen/testdata/modifiers/ReturnInModifier | Modifier early return |
| test/libsolidity/semanticTests/modifiers/evaluation_order.sol | modifiers | ported | medium | crates/codegen/testdata/modifiers/EvaluationOrder | Base ctor + modifier evaluation order |
| test/libsolidity/semanticTests/modifiers/function_modifier_multiple_times.sol | modifiers | ported | low | crates/codegen/testdata/modifiers/FunctionModifierMultipleTimes | Repeated modifiers add up |
| test/libsolidity/semanticTests/modifiers/function_modifier_loop.sol | modifiers | ported | medium | crates/codegen/testdata/modifiers/FunctionModifierLoop | Modifier invokes body in loop |
| test/libsolidity/semanticTests/modifiers/function_modifier_multi_invocation.sol | modifiers | ported | medium | crates/codegen/testdata/modifiers/FunctionModifierMultiInvocation | Modifier invokes body multiple times |
| test/libsolidity/semanticTests/receive/empty_calldata_calls_receive.sol | receive | ported | medium | crates/codegen/testdata/receive/EmptyCalldataCallsReceive | Empty calldata hits receive |
| test/libsolidity/semanticTests/receive/ether_and_data.sol | receive | ported | medium | crates/codegen/testdata/receive/EtherAndData | Receive accepts ether, rejects data |
| test/libsolidity/semanticTests/receive/inherited.sol | receive | ported | low | crates/codegen/testdata/receive/ReceiveInherited | Inherited receive |

## Fallback (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/fallback/fallback_or_receive.sol | fallback | ported | medium | crates/codegen/testdata/fallback/FallbackOrReceive | Distinguish fallback vs receive |
| test/libsolidity/semanticTests/fallback/short_data_calls_fallback.sol | fallback | ported | medium | crates/codegen/testdata/fallback/ShortDataCallsFallback | Short calldata hits fallback |
| test/libsolidity/semanticTests/fallback/fallback_argument.sol | fallback | ported | medium | crates/codegen/testdata/fallback/FallbackArgument | Fallback with calldata argument |
| test/libsolidity/semanticTests/fallback/falback_return.sol | fallback | ported | low | crates/codegen/testdata/fallback/FallbackReturn | Fallback early return |
| test/libsolidity/semanticTests/fallback/fallback_return_data.sol | fallback | ported | medium | crates/codegen/testdata/fallback/FallbackReturnData | Fallback returns calldata |

## Phase 3 (ABI + Edge Cases)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/abiEncodeDecode/* | abiEncodeDecode | planned | high | testdata/semantic/abiEncodeDecode/ | Expand to dynamic arrays, tuples |
| test/libsolidity/semanticTests/revertStrings/* | revertStrings | planned | high | testdata/semantic/revertStrings/ | Strict revert data matching |
| test/libsolidity/semanticTests/revertStrings/ether_non_payable_function.sol | revertStrings | ported | medium | crates/codegen/testdata/revert-strings/EtherNonPayableFunction | Non-payable revert |
| test/libsolidity/semanticTests/revertStrings/unknown_sig_no_fallback.sol | revertStrings | ported | medium | crates/codegen/testdata/revert-strings/UnknownSigNoFallback | Unknown signature revert |
| test/libsolidity/semanticTests/multiSource/* | multiSource | planned | medium | testdata/semantic/multiSource/ | Requires multi-file setup |

## Strings (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/strings/empty_string.sol | strings | ported | low | crates/codegen/testdata/strings/EmptyString | Empty string returns |
| test/libsolidity/semanticTests/strings/return_string.sol | strings | ported | medium | crates/codegen/testdata/strings/ReturnString | Storage -> memory string returns |
| test/libsolidity/semanticTests/strings/constant_string_literal.sol | strings | ported | medium | crates/codegen/testdata/strings/ConstantStringLiteral | Constant bytes32 + string literals |
| test/libsolidity/semanticTests/strings/empty_string_input.sol | strings | ported | medium | crates/codegen/testdata/strings/EmptyStringInput | Empty string calldata handling |

## Literals (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/literals/denominations.sol | literals | ported | low | crates/codegen/testdata/literals/Denominations | Ether/gwei/wei sums |
| test/libsolidity/semanticTests/literals/ether.sol | literals | ported | low | crates/codegen/testdata/literals/EtherLiteral | Ether denomination |
| test/libsolidity/semanticTests/literals/gwei.sol | literals | ported | low | crates/codegen/testdata/literals/GweiLiteral | Gwei denomination |
| test/libsolidity/semanticTests/literals/wei.sol | literals | ported | low | crates/codegen/testdata/literals/WeiLiteral | Wei denomination |
| test/libsolidity/semanticTests/literals/fractional_denominations.sol | literals | ported | low | crates/codegen/testdata/literals/FractionalDenominations | Fractional time/ether units |
| test/libsolidity/semanticTests/literals/scientific_notation.sol | literals | ported | low | crates/codegen/testdata/literals/ScientificNotation | Scientific notation (int/uint) |

## Expressions (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/expressions/conditional_expression_true_literal.sol | expressions | ported | low | crates/codegen/testdata/expressions/ConditionalExpression | Ternary with true literal |
| test/libsolidity/semanticTests/expressions/conditional_expression_false_literal.sol | expressions | ported | low | crates/codegen/testdata/expressions/ConditionalExpression | Ternary with false literal |
| test/libsolidity/semanticTests/expressions/inc_dec_operators.sol | expressions | ported | low | crates/codegen/testdata/expressions/IncDecOperators | Pre/post inc/dec evaluation |
| test/libsolidity/semanticTests/expressions/bit_operators.sol | expressions | ported | medium | crates/codegen/testdata/expressions/BitOperators | Bitwise ops on mixed widths |
| test/libsolidity/semanticTests/expressions/bytes_comparison.sol | expressions | ported | low | crates/codegen/testdata/expressions/BytesComparison | Bytes comparison ordering |

## Operators (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/operators/shifts/shift_left.sol | operators | ported | low | crates/codegen/testdata/operators/ShiftLeft | Left shift semantics |
| test/libsolidity/semanticTests/operators/shifts/shift_right.sol | operators | ported | low | crates/codegen/testdata/operators/ShiftRight | Right shift semantics |

## Statements / Scoping (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/statements/empty_for_loop.sol | statements | ported | low | crates/codegen/testdata/statements/EmptyForLoop | Empty for-loop with break |
| test/libsolidity/semanticTests/statements/do_while_loop_continue.sol | statements | ported | low | crates/codegen/testdata/statements/DoWhileLoopContinue | do/while + continue |
| test/libsolidity/semanticTests/scoping/c99_scoping_activation.sol | scoping | ported | low | crates/codegen/testdata/scoping/C99ScopingActivation | C99 scoping/ shadowing |

## Conversions (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/conversions/string_to_bytes.sol | conversions | ported | low | crates/codegen/testdata/conversions/StringToBytes | string -> bytes conversion |

## Calldata (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/calldata/calldata_bytes_external.sol | calldata | ported | medium | crates/codegen/testdata/calldata/CalldataBytesExternal | External calldata slice access |
| test/libsolidity/semanticTests/calldata/calldata_bytes_internal.sol | calldata | ported | medium | crates/codegen/testdata/calldata/CalldataBytesInternal | Internal calldata slice access |
| test/libsolidity/semanticTests/calldata/calldata_bytes_to_memory.sol | calldata | ported | medium | crates/codegen/testdata/calldata/CalldataBytesToMemory | calldata bytes -> memory keccak |
| test/libsolidity/semanticTests/calldata/calldata_bytes_array_bounds.sol | calldata | ported | medium | crates/codegen/testdata/calldata/CalldataBytesArrayBounds | bytes[] bounds checks |
| test/libsolidity/semanticTests/calldata/calldata_bytes_to_memory_encode.sol | calldata | ported | medium | crates/codegen/testdata/calldata/CalldataBytesToMemoryEncode | abi.encode(bytes(calldata)) |
| test/libsolidity/semanticTests/calldata/calldata_array_length.sol | calldata | ported | medium | crates/codegen/testdata/calldata/CalldataArrayLength | length on 1d/2d/fixed arrays (valid cases only) |
| test/libsolidity/semanticTests/calldata/calldata_array_access.sol | calldata | ported | medium | crates/codegen/testdata/calldata/CalldataArrayAccess | element access + bounds reverts |
| test/libsolidity/semanticTests/calldata/calldata_array_index_range_access.sol | calldata | ported | medium | crates/codegen/testdata/calldata/CalldataArrayIndexRangeAccess | slicing length + index access + bounds reverts |

## Memory Management (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/memoryManagement/memory_types_initialisation.sol | memory | ported | medium | crates/codegen/testdata/memory-management/MemoryTypesInitialization | Zero-initialization of memory returns |

## Try/Catch (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/tryCatch/simple.sol | tryCatch | ported | medium | crates/codegen/testdata/try-catch/TryCatchSimple | Basic try/catch on external call |
| test/libsolidity/semanticTests/tryCatch/lowLevel.sol | tryCatch | ported | medium | crates/codegen/testdata/try-catch/TryCatchLowLevel | catch(bytes) revert data |
| test/libsolidity/semanticTests/tryCatch/structured.sol | tryCatch | ported | medium | crates/codegen/testdata/try-catch/TryCatchStructured | catch Error(string) message |
| test/libsolidity/semanticTests/tryCatch/require.sol | tryCatch | ported | medium | crates/codegen/testdata/try-catch/TryCatchRequire | try/catch around require |
| test/libsolidity/semanticTests/tryCatch/panic.sol | tryCatch | ported | medium | crates/codegen/testdata/try-catch/TryCatchPanic | catch Panic(uint) + Error(string) |

## Payable (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/payable/no_nonpayable_circumvention_by_modifier.sol | payable | ported | medium | crates/codegen/testdata/payable/NoNonpayableCircumventionByModifier | Nonpayable enforcement through modifier |

## Immutables (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/immutable/read_in_ctor.sol | immutable | ported | low | crates/codegen/testdata/immutable/ReadInConstructor | Immutable read inside constructor |

## Builtins / Hashing (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/builtinFunctions/keccak256_empty.sol | hashing | ported | low | crates/codegen/testdata/hashing/HashBuiltins | keccak256 empty string |
| test/libsolidity/semanticTests/builtinFunctions/sha256_empty.sol | hashing | ported | low | crates/codegen/testdata/hashing/HashBuiltins | sha256 empty string |
| test/libsolidity/semanticTests/builtinFunctions/ripemd160_empty.sol | hashing | ported | low | crates/codegen/testdata/hashing/HashBuiltins | ripemd160 empty string |
| test/libsolidity/semanticTests/builtinFunctions/keccak256_with_bytes.sol | hashing | ported | low | crates/codegen/testdata/hashing/HashBuiltins | keccak256(bytes) matches literal |
| test/libsolidity/semanticTests/builtinFunctions/msg_sig.sol | builtin | ported | low | crates/codegen/testdata/builtin-functions/MsgSig | msg.sig selector value |
| test/libsolidity/semanticTests/builtinFunctions/msg_sig_after_internal_call_is_same.sol | builtin | ported | low | crates/codegen/testdata/builtin-functions/MsgSigInternal | msg.sig preserved across internal call |
| test/libsolidity/semanticTests/builtinFunctions/keccak256_packed.sol | builtin | ported | low | crates/codegen/testdata/builtin-functions/KeccakPacked | keccak256(abi.encodePacked) |
| test/libsolidity/semanticTests/builtinFunctions/keccak256_multiple_arguments.sol | builtin | ported | low | crates/codegen/testdata/builtin-functions/KeccakMultiple | keccak256 packed 3 args |
| test/libsolidity/semanticTests/builtinFunctions/keccak256_multiple_arguments_with_numeric_literals.sol | builtin | ported | low | crates/codegen/testdata/builtin-functions/KeccakMultipleNumeric | keccak256 packed numeric literals |
| test/libsolidity/semanticTests/builtinFunctions/keccak256_multiple_arguments_with_string_literals.sol | builtin | ported | low | crates/codegen/testdata/builtin-functions/KeccakMultipleString | keccak256 packed string literal |

## Enums (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/enums/constructing_enums_from_ints.sol | enums | ported | low | crates/codegen/testdata/enums/ConstructingEnumsFromInts | Enum cast from int |
| test/libsolidity/semanticTests/enums/minmax.sol | enums | ported | low | crates/codegen/testdata/enums/EnumMinMax | Enum min/max |
| test/libsolidity/semanticTests/enums/using_enums.sol | enums | ported | low | crates/codegen/testdata/enums/UsingEnums | Enum stored in state |
| test/libsolidity/semanticTests/enums/enum_referencing.sol | enums | ported | medium | crates/codegen/testdata/enums/EnumReferencing | Enum refs across interface/library |
| test/libsolidity/semanticTests/enums/using_inherited_enum.sol | enums | ported | low | crates/codegen/testdata/enums/UsingInheritedEnum | Inherited enum usage |

## Errors (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/errors/simple.sol | errors | ported | medium | crates/codegen/testdata/errors/SimpleError | Custom error selector + args |
| test/libsolidity/semanticTests/errors/error_selector.sol | errors | ported | medium | crates/codegen/testdata/errors/ErrorSelector | Error selector consistency |
| test/libsolidity/semanticTests/errors/require_error_string_literal.sol | errors | ported | medium | crates/codegen/testdata/errors/RequireErrorStringLiteral | require with custom error string |
| test/libsolidity/semanticTests/errors/require_error_string_memory.sol | errors | ported | medium | crates/codegen/testdata/errors/RequireErrorStringMemory | require with memory string |
| test/libsolidity/semanticTests/errors/require_error_uint256.sol | errors | ported | medium | crates/codegen/testdata/errors/RequireErrorUint256 | require with custom error uint |
| test/libsolidity/semanticTests/errors/named_error_args.sol | errors | ported | low | crates/codegen/testdata/errors/NamedErrorArgs | Named error args |
| test/libsolidity/semanticTests/errors/require_error_multiple_arguments.sol | errors | ported | medium | crates/codegen/testdata/errors/RequireErrorMultipleArguments | Custom error with multiple args |
| test/libsolidity/semanticTests/errors/require_error_condition_evaluated_only_once.sol | errors | ported | medium | crates/codegen/testdata/errors/RequireErrorConditionEvaluatedOnce | Require condition evaluated once |
| test/libsolidity/semanticTests/errors/require_error_evaluation_order_1.sol | errors | ported | medium | crates/codegen/testdata/errors/RequireErrorEvaluationOrder1 | Require error evaluation order |
| test/libsolidity/semanticTests/errors/require_error_evaluation_order_2.sol | errors | ported | medium | crates/codegen/testdata/errors/RequireErrorEvaluationOrder2 | Require error evaluation order (state) |
| test/libsolidity/semanticTests/errors/require_error_evaluation_order_3.sol | errors | ported | medium | crates/codegen/testdata/errors/RequireErrorEvaluationOrder3 | Require error evaluation order (string) |

## Structs (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/structs/simple_struct_allocation.sol | structs | ported | low | crates/codegen/testdata/structs/SimpleStructAllocation | Memory struct allocation |
| test/libsolidity/semanticTests/structs/struct_copy.sol | structs | ported | medium | crates/codegen/testdata/structs/StructCopy | Struct copy in mapping |
| test/libsolidity/semanticTests/structs/memory_structs_read_write.sol | structs | ported | medium | crates/codegen/testdata/structs/MemoryStructsReadWrite | Memory struct read/write |
| test/libsolidity/semanticTests/structs/struct_delete_member.sol | structs | ported | medium | crates/codegen/testdata/structs/StructDeleteMember | Delete struct member |
| test/libsolidity/semanticTests/structs/struct_named_constructor.sol | structs | ported | low | crates/codegen/testdata/structs/StructNamedConstructor | Struct named constructor |
| test/libsolidity/semanticTests/structs/struct_reference.sol | structs | ported | medium | crates/codegen/testdata/structs/StructReference | Recursive struct reference |
| test/libsolidity/semanticTests/structs/struct_copy_via_local.sol | structs | ported | medium | crates/codegen/testdata/structs/StructCopyViaLocal | Struct copy via local memory |
| test/libsolidity/semanticTests/structs/struct_assign_reference_to_struct.sol | structs | ported | medium | crates/codegen/testdata/structs/StructAssignReferenceToStruct | Struct storage reference vs copy |
| test/libsolidity/semanticTests/structs/struct_storage_push_zero_value.sol | structs | ported | medium | crates/codegen/testdata/structs/StructStoragePushZeroValue | Struct push zero initialization |
| test/libsolidity/semanticTests/array/strings_in_struct.sol | structs | ported | low | crates/codegen/testdata/structs/StringsInStruct | String member in struct |

## Libraries (Additional Coverage)

| Solidity Test Path | Category | Status | Risk | Solar Target Path | Notes |
| --- | --- | --- | --- | --- | --- |
| test/libsolidity/semanticTests/libraries/internal_library_function.sol | libraries | ported | medium | crates/codegen/testdata/libraries/InternalLibraryFunction | Internal library function inlined |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_integer.sol | libraries | ported | low | crates/codegen/testdata/libraries/InternalLibraryFunctionAttachedToInteger | `using for` on uint256 |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_bool.sol | libraries | ported | low | crates/codegen/testdata/libraries/InternalLibraryFunctionAttachedToBool | `using for` on bool |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_string_accepting_memory.sol | libraries | ported | low | crates/codegen/testdata/libraries/InternalLibraryFunctionAttachedToStringMemory | `using for` on string (memory) |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_array_named_pop_push.sol | libraries | ported | low | crates/codegen/testdata/libraries/InternalLibraryFunctionAttachedToArrayNamedPopPush | `using for` on fixed array |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_address.sol | libraries | ported | low | crates/codegen/testdata/libraries/InternalLibraryFunctionAttachedToAddress | `using for` on address |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_fixed_bytes.sol | libraries | ported | low | crates/codegen/testdata/libraries/InternalLibraryFunctionAttachedToFixedBytes | `using for` on fixed bytes |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_enum.sol | libraries | ported | low | crates/codegen/testdata/libraries/InternalLibraryFunctionAttachedToEnum | `using for` on enum |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_contract.sol | libraries | ported | low | crates/codegen/testdata/libraries/InternalLibraryFunctionAttachedToContract | `using for` on contract type |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_dynamic_array.sol | libraries | ported | low | crates/codegen/testdata/libraries/InternalLibraryFunctionAttachedToDynamicArray | `using for` on dynamic array |
| test/libsolidity/semanticTests/libraries/internal_library_function_attached_to_literal.sol | libraries | ported | low | crates/codegen/testdata/libraries/InternalLibraryFunctionAttachedToLiteral | `using for` on literal |

## Skips (EVM-Version-Specific or Out of Scope)

| Solidity Test Path | Reason |
| --- | --- |
| test/libsolidity/semanticTests/shanghai/* | EVM-version specific; avoid until EVM version is pinned |
| test/libsolidity/semanticTests/eof/* | EOF-specific behavior; not yet targeted |
| test/libsolidity/semanticTests/viaYul/* | Pipeline-specific (via Yul) |
| test/libsolidity/semanticTests/optimizer/* | Optimization-specific |
| test/externalTests/* | Non-deterministic / heavy integration |
