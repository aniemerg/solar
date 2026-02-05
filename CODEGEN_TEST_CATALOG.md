# Solar Codegen Test Catalog

Exhaustive inventory of Foundry-based codegen test projects under `crates/codegen/testdata-ported/`.
Each category is a Foundry project; sub-categories list Solidity sources (`src/`) and test files (`test/`).
Descriptions are inferred from file names when no explicit header comment exists.

## abi-encode-decode

- Path: `crates/codegen/testdata-ported/abi-encode-decode`
- Foundry project: yes

### Sources (`src/`)

- `AbiDecodeCalldata.sol`: Abi Decode Calldata
- `AbiDecodeSimple.sol`: Abi Decode Simple
- `AbiDecodeSimpleStorage.sol`: Abi Decode Simple Storage
- `AbiEncodeCall.sol`: Abi Encode Call
- `AbiEncodeCallMemory.sol`: Abi Encode Call Memory
- `AbiEncodeWithSelector.sol`: Abi Encode With Selector
- `AbiEncodeWithSignature.sol`: Abi Encode With Signature

### Tests (`test/`)

- `AbiDecodeCalldata.t.sol`: Abi Decode Calldata.t
- `AbiDecodeSimple.t.sol`: Abi Decode Simple.t
- `AbiDecodeSimpleStorage.t.sol`: Abi Decode Simple Storage.t
- `AbiEncodeCall.t.sol`: Abi Encode Call.t
- `AbiEncodeCallMemory.t.sol`: Abi Encode Call Memory.t
- `AbiEncodeWithSelector.t.sol`: Abi Encode With Selector.t
- `AbiEncodeWithSignature.t.sol`: Abi Encode With Signature.t

## abi-encoding

- Path: `crates/codegen/testdata-ported/abi-encoding`
- Foundry project: yes

### Sources (`src/`)

- `AbiEncoding.sol`: Abi Encoding

### Tests (`test/`)

- `AbiEncoding.t.sol`: Abi Encoding.t

## access-control

- Path: `crates/codegen/testdata-ported/access-control`
- Foundry project: yes

### Sources (`src/`)

- `AccessControl.sol`: Access Control

### Tests (`test/`)

- `AccessControl.t.sol`: Access Control.t

## arithmetic

- Path: `crates/codegen/testdata-ported/arithmetic`
- Foundry project: yes

### Sources (`src/`)

- `Arithmetic.sol`: Arithmetic
- `CheckedAddV2.sol`: Checked Add V2
- `Counter.sol`: Counter
- `ExponentiationLiteralBase.sol`: Exponentiation Literal Base
- `ExponentiationSignedBase.sol`: Exponentiation Signed Base
- `ExponentiationSmallExp.sol`: Exponentiation Small Exp
- `IntegerBasic.sol`: Integer Basic
- `LocalSecondOperand.sol`: Local Second Operand
- `Minimal.sol`: Minimal
- `UncheckedDivByZero.sol`: Unchecked Div By Zero

### Tests (`test/`)

- `Arithmetic.t.sol`: Arithmetic.t
- `CheckedAddV2.t.sol`: Checked Add V2.t
- `Counter.t.sol`: Counter.t
- `ExponentiationLiteralBase.t.sol`: Exponentiation Literal Base.t
- `ExponentiationSignedBase.t.sol`: Exponentiation Signed Base.t
- `ExponentiationSmallExp.t.sol`: Exponentiation Small Exp.t
- `IntegerBasic.t.sol`: Integer Basic.t
- `LocalSecondOperand.t.sol`: Local Second Operand.t
- `Minimal.t.sol`: Minimal.t
- `UncheckedDivByZero.t.sol`: Unchecked Div By Zero.t

## arrays

- Path: `crates/codegen/testdata-ported/arrays`
- Foundry project: yes

### Sources (`src/`)

- `Array2dZeroedMemoryIndexAccess.sol`: Array2d Zeroed Memory Index Access
- `ArrayArrayStatic.sol`: Array Array Static
- `ArrayCalldataFixed.sol`: Array Calldata Fixed
- `ArrayMemoryIndexAccess.sol`: Array Memory Index Access
- `ArrayPushReturnReference.sol`: Array Push Return Reference
- `ArrayPushWithArg.sol`: Array Push With Arg
- `ArrayStaticReturnParamZeroedMemory.sol`: Array Static Return Param Zeroed Memory
- `ArrayStaticZeroedMemoryIndexAccess.sol`: Array Static Zeroed Memory Index Access
- `ArrayStorageBoundaryCheck.sol`: Array Storage Boundary Check
- `ArrayStorageIndexAccess.sol`: Array Storage Index Access
- `ArrayStorageIndexZeroed.sol`: Array Storage Index Zeroed
- `ArrayStorageLengthAccess.sol`: Array Storage Length Access
- `ArrayStoragePopZeroLength.sol`: Array Storage Pop Zero Length
- `ArrayStoragePushEmpty.sol`: Array Storage Push Empty
- `ArrayStoragePushEmptyLengthAddress.sol`: Array Storage Push Empty Length Address
- `ArrayStoragePushPop.sol`: Array Storage Push Pop
- `ArrayZeroedMemoryIndexAccess.sol`: Array Zeroed Memory Index Access
- `ArraysComplexFromAndToStorage.sol`: Arrays Complex From And To Storage
- `ArraysComplexMemoryIndexAccess.sol`: Arrays Complex Memory Index Access
- `ByteArrayStorageLayout.sol`: Byte Array Storage Layout
- `BytesIndexAccess.sol`: Bytes Index Access
- `BytesIndexAccessMemory.sol`: Bytes Index Access Memory
- `BytesMemoryIndexAccess.sol`: Bytes Memory Index Access
- `CalldataArraySlice.sol`: Calldata Array Slice
- `CreateDynamicArrayZeroLength.sol`: Create Dynamic Array Zero Length
- `CreateMemoryArray.sol`: Create Memory Array
- `FixedBytesIndexAccess.sol`: Fixed Bytes Index Access
- `IndexAccess.sol`: Index Access
- `InlineArrayIndexAccessInts.sol`: Inline Array Index Access Ints
- `InlineArrayIndexAccessStrings.sol`: Inline Array Index Access Strings
- `InlineArraySingleton.sol`: Inline Array Singleton
- `MemoryArraysDynamicIndexAccessWrite.sol`: Memory Arrays Dynamic Index Access Write
- `MemoryArraysIndexAccessWrite.sol`: Memory Arrays Index Access Write
- `StorageArrayRef.sol`: Storage Array Ref
- `StringLiteralAssignToStorageBytes.sol`: String Literal Assign To Storage Bytes

### Tests (`test/`)

- `Array2dZeroedMemoryIndexAccess.t.sol`: Array2d Zeroed Memory Index Access.t
- `ArrayArrayStatic.t.sol`: Array Array Static.t
- `ArrayCalldataFixed.t.sol`: Array Calldata Fixed.t
- `ArrayMemoryIndexAccess.t.sol`: Array Memory Index Access.t
- `ArrayPushReturnReference.t.sol`: Array Push Return Reference.t
- `ArrayPushWithArg.t.sol`: Array Push With Arg.t
- `ArrayStaticReturnParamZeroedMemory.t.sol`: Array Static Return Param Zeroed Memory.t
- `ArrayStaticZeroedMemoryIndexAccess.t.sol`: Array Static Zeroed Memory Index Access.t
- `ArrayStorageBoundaryCheck.t.sol`: Array Storage Boundary Check.t
- `ArrayStorageIndexAccess.t.sol`: Array Storage Index Access.t
- `ArrayStorageIndexZeroed.t.sol`: Array Storage Index Zeroed.t
- `ArrayStorageLengthAccess.t.sol`: Array Storage Length Access.t
- `ArrayStoragePopZeroLength.t.sol`: Array Storage Pop Zero Length.t
- `ArrayStoragePushEmpty.t.sol`: Array Storage Push Empty.t
- `ArrayStoragePushEmptyLengthAddress.t.sol`: Array Storage Push Empty Length Address.t
- `ArrayStoragePushPop.t.sol`: Array Storage Push Pop.t
- `ArrayZeroedMemoryIndexAccess.t.sol`: Array Zeroed Memory Index Access.t
- `ArraysComplexFromAndToStorage.t.sol`: Arrays Complex From And To Storage.t
- `ArraysComplexMemoryIndexAccess.t.sol`: Arrays Complex Memory Index Access.t
- `ByteArrayStorageLayout.t.sol`: Byte Array Storage Layout.t
- `BytesIndexAccess.t.sol`: Bytes Index Access.t
- `BytesIndexAccessMemory.t.sol`: Bytes Index Access Memory.t
- `BytesMemoryIndexAccess.t.sol`: Bytes Memory Index Access.t
- `CalldataArraySlice.t.sol`: Calldata Array Slice.t
- `CreateDynamicArrayZeroLength.t.sol`: Create Dynamic Array Zero Length.t
- `CreateMemoryArray.t.sol`: Create Memory Array.t
- `FixedBytesIndexAccess.t.sol`: Fixed Bytes Index Access.t
- `IndexAccess.t.sol`: Index Access.t
- `InlineArrayIndexAccessInts.t.sol`: Inline Array Index Access Ints.t
- `InlineArrayIndexAccessStrings.t.sol`: Inline Array Index Access Strings.t
- `InlineArraySingleton.t.sol`: Inline Array Singleton.t
- `MemoryArraysDynamicIndexAccessWrite.t.sol`: Memory Arrays Dynamic Index Access Write.t
- `MemoryArraysIndexAccessWrite.t.sol`: Memory Arrays Index Access Write.t
- `StorageArrayRef.t.sol`: Storage Array Ref.t
- `StringLiteralAssignToStorageBytes.t.sol`: String Literal Assign To Storage Bytes.t

## calldata

- Path: `crates/codegen/testdata-ported/calldata`
- Foundry project: yes

### Sources (`src/`)

- `CalldataBytesExternal.sol`: Calldata Bytes External
- `CalldataBytesInternal.sol`: Calldata Bytes Internal
- `CalldataBytesToMemory.sol`: Calldata Bytes To Memory

### Tests (`test/`)

- `CalldataBytesExternal.t.sol`: Calldata Bytes External.t
- `CalldataBytesInternal.t.sol`: Calldata Bytes Internal.t
- `CalldataBytesToMemory.t.sol`: Calldata Bytes To Memory.t

## calls

- Path: `crates/codegen/testdata-ported/calls`
- Foundry project: yes

### Sources (`src/`)

- `CallOptionsOverload.sol`: Call Options Overload
- `ConditionalWithArguments.sol`: Conditional With Arguments
- `CreationFunctionCallNoArgs.sol`: Creation Function Call No Args
- `CreationFunctionCallWithArgs.sol`: Creation Function Call With Args
- `ExternalCall.sol`: External Call
- `ExternalCallDynamicReturndata.sol`: External Call Dynamic Returndata
- `ExternalCallValue.sol`: External Call Value
- `ExternalFunction.sol`: External Function
- `FunctionSelector1.sol`: Function Selector1
- `FunctionSelector2.sol`: Function Selector2
- `MultipleFunctions.sol`: Multiple Functions
- `MultipleReturnValues.sol`: Multiple Return Values
- `NamedArgs.sol`: Named Args
- `NamedArgsOverload.sol`: Named Args Overload
- `NestedCalls.sol`: Nested Calls

### Tests (`test/`)

- `CallOptionsOverload.t.sol`: Call Options Overload.t
- `ConditionalWithArguments.t.sol`: Conditional With Arguments.t
- `CreationFunctionCallNoArgs.t.sol`: Creation Function Call No Args.t
- `CreationFunctionCallWithArgs.t.sol`: Creation Function Call With Args.t
- `ExternalCall.t.sol`: External Call.t
- `ExternalCallDynamicReturndata.t.sol`: External Call Dynamic Returndata.t
- `ExternalCallValue.t.sol`: External Call Value.t
- `ExternalFunction.t.sol`: External Function.t
- `FunctionSelector1.t.sol`: Function Selector1.t
- `FunctionSelector2.t.sol`: Function Selector2.t
- `MultipleFunctions.t.sol`: Multiple Functions.t
- `MultipleReturnValues.t.sol`: Multiple Return Values.t
- `NamedArgs.t.sol`: Named Args.t
- `NamedArgsOverload.t.sol`: Named Args Overload.t
- `NestedCalls.t.sol`: Nested Calls.t

## constructor

- Path: `crates/codegen/testdata-ported/constructor`
- Foundry project: yes

### Sources (`src/`)

- `ArraysInConstructors.sol`: Arrays In Constructors
- `BaseConstructorArguments.sol`: Base Constructor Arguments
- `ConstructorArgumentsExternal.sol`: Constructor Arguments External
- `ConstructorOrderOfEvaluation.sol`: Constructor Order Of Evaluation
- `ConstructorStaticArrayArgument.sol`: Constructor Static Array Argument
- `ConstructorWithParams.sol`: Constructor With Params
- `StateVariableInitialization.sol`: State Variable Initialization

### Tests (`test/`)

- `ArraysInConstructors.t.sol`: Arrays In Constructors.t
- `BaseConstructorArguments.t.sol`: Base Constructor Arguments.t
- `ConstructorArgumentsExternal.t.sol`: Constructor Arguments External.t
- `ConstructorOrderOfEvaluation.t.sol`: Constructor Order Of Evaluation.t
- `ConstructorStaticArrayArgument.t.sol`: Constructor Static Array Argument.t
- `ConstructorWithParams.t.sol`: Constructor With Params.t
- `StateVariableInitialization.t.sol`: State Variable Initialization.t

## constructor-args

- Path: `crates/codegen/testdata-ported/constructor-args`
- Foundry project: yes

### Sources (`src/`)

- `ConstructorArgs.sol`: Constructor Args

### Tests (`test/`)

- `ConstructorArgs.t.sol`: Constructor Args.t

## control-flow

- Path: `crates/codegen/testdata-ported/control-flow`
- Foundry project: yes

### Sources (`src/`)

- `BoolLogic.sol`: Bool Logic
- `CollatzCalls.sol`: Collatz Calls
- `ControlFlow.sol`: Control Flow
- `Require.sol`: Require

### Tests (`test/`)

- `BoolLogic.t.sol`: Bool Logic.t
- `CollatzCalls.t.sol`: Collatz Calls.t
- `ControlFlow.t.sol`: Control Flow.t
- `Require.t.sol`: Require.t

## conversions

- Path: `crates/codegen/testdata-ported/conversions`
- Foundry project: yes

### Sources (`src/`)

- `StringToBytes.sol`: String To Bytes

### Tests (`test/`)

- `StringToBytes.t.sol`: String To Bytes.t

## edge-cases

- Path: `crates/codegen/testdata-ported/edge-cases`
- Foundry project: yes

### Sources (`src/`)

- `EdgeCases.sol`: Edge Cases

### Tests (`test/`)

- `EdgeCases.t.sol`: Edge Cases.t

## enums

- Path: `crates/codegen/testdata-ported/enums`
- Foundry project: yes

### Sources (`src/`)

- `ConstructingEnumsFromInts.sol`: Constructing Enums From Ints
- `EnumMinMax.sol`: Enum Min Max
- `EnumReferencing.sol`: Enum Referencing
- `Enums.sol`: Enums
- `UsingEnums.sol`: Using Enums
- `UsingInheritedEnum.sol`: Using Inherited Enum

### Tests (`test/`)

- `ConstructingEnumsFromInts.t.sol`: Constructing Enums From Ints.t
- `EnumMinMax.t.sol`: Enum Min Max.t
- `EnumReferencing.t.sol`: Enum Referencing.t
- `Enums.t.sol`: Enums.t
- `UsingEnums.t.sol`: Using Enums.t
- `UsingInheritedEnum.t.sol`: Using Inherited Enum.t

## equivalence

- Path: `crates/codegen/testdata-ported/equivalence`
- Foundry project: yes

### Sources (`src/`)

- `Counter.sol`: Counter
- `Events.sol`: Events
- `Inheritance.sol`: Inheritance
- `Mapping.sol`: Mapping
- `Modifiers.sol`: Modifiers
- `MultipleReturns.sol`: Multiple Returns

### Tests (`test/`)

- `Equivalence.t.sol`: Equivalence.t

## erc20-minimal

- Path: `crates/codegen/testdata-ported/erc20-minimal`
- Foundry project: yes

### Sources (`src/`)

- `ERC20.sol`: ERC20

### Tests (`test/`)

- `ERC20.t.sol`: ERC20.t

## erc721-minimal

- Path: `crates/codegen/testdata-ported/erc721-minimal`
- Foundry project: yes

### Sources (`src/`)

- `ERC721.sol`: ERC721

### Tests (`test/`)

- `ERC721.t.sol`: ERC721.t

## errors

- Path: `crates/codegen/testdata-ported/errors`
- Foundry project: yes

### Sources (`src/`)

- `ErrorSelector.sol`: Error Selector
- `NamedErrorArgs.sol`: Named Error Args
- `RequireErrorConditionEvaluatedOnce.sol`: Require Error Condition Evaluated Once
- `RequireErrorEvaluationOrder1.sol`: Require Error Evaluation Order1
- `RequireErrorEvaluationOrder2.sol`: Require Error Evaluation Order2
- `RequireErrorEvaluationOrder3.sol`: Require Error Evaluation Order3
- `RequireErrorMultipleArguments.sol`: Require Error Multiple Arguments
- `RequireErrorStringLiteral.sol`: Require Error String Literal
- `RequireErrorStringMemory.sol`: Require Error String Memory
- `RequireErrorUint256.sol`: Require Error Uint256
- `SimpleError.sol`: Simple Error

### Tests (`test/`)

- `ErrorSelector.t.sol`: Error Selector.t
- `NamedErrorArgs.t.sol`: Named Error Args.t
- `RequireErrorConditionEvaluatedOnce.t.sol`: Require Error Condition Evaluated Once.t
- `RequireErrorEvaluationOrder1.t.sol`: Require Error Evaluation Order1.t
- `RequireErrorEvaluationOrder2.t.sol`: Require Error Evaluation Order2.t
- `RequireErrorEvaluationOrder3.t.sol`: Require Error Evaluation Order3.t
- `RequireErrorMultipleArguments.t.sol`: Require Error Multiple Arguments.t
- `RequireErrorStringLiteral.t.sol`: Require Error String Literal.t
- `RequireErrorStringMemory.t.sol`: Require Error String Memory.t
- `RequireErrorUint256.t.sol`: Require Error Uint256.t
- `SimpleError.t.sol`: Simple Error.t

## events

- Path: `crates/codegen/testdata-ported/events`
- Foundry project: yes

### Sources (`src/`)

- `EventAnonymous.sol`: Event Anonymous
- `EventAnonymousWithTopics.sol`: Event Anonymous With Topics
- `EventDynamicArrayMemory.sol`: Event Dynamic Array Memory
- `EventDynamicArrayStorage.sol`: Event Dynamic Array Storage
- `EventEmit.sol`: Event Emit
- `EventIndexedMixed.sol`: Event Indexed Mixed
- `EventIndexedString.sol`: Event Indexed String
- `EventNoArguments.sol`: Event No Arguments
- `EventSelector.sol`: Event Selector
- `EventString.sol`: Event String
- `EventStructMemory.sol`: Event Struct Memory
- `EventStructStorage.sol`: Event Struct Storage
- `Events.sol`: Events

### Tests (`test/`)

- `EventAnonymous.t.sol`: Event Anonymous.t
- `EventAnonymousWithTopics.t.sol`: Event Anonymous With Topics.t
- `EventDynamicArrayMemory.t.sol`: Event Dynamic Array Memory.t
- `EventDynamicArrayStorage.t.sol`: Event Dynamic Array Storage.t
- `EventEmit.t.sol`: Event Emit.t
- `EventIndexedMixed.t.sol`: Event Indexed Mixed.t
- `EventIndexedString.t.sol`: Event Indexed String.t
- `EventNoArguments.t.sol`: Event No Arguments.t
- `EventSelector.t.sol`: Event Selector.t
- `EventString.t.sol`: Event String.t
- `EventStructMemory.t.sol`: Event Struct Memory.t
- `EventStructStorage.t.sol`: Event Struct Storage.t
- `Events.t.sol`: Events.t

## expressions

- Path: `crates/codegen/testdata-ported/expressions`
- Foundry project: yes

### Sources (`src/`)

- `BitOperators.sol`: Bit Operators
- `BytesComparison.sol`: Bytes Comparison
- `ConditionalExpression.sol`: Conditional Expression
- `IncDecOperators.sol`: Inc Dec Operators

### Tests (`test/`)

- `BitOperators.t.sol`: Bit Operators.t
- `BytesComparison.t.sol`: Bytes Comparison.t
- `ConditionalExpression.t.sol`: Conditional Expression.t
- `IncDecOperators.t.sol`: Inc Dec Operators.t

## fallback

- Path: `crates/codegen/testdata-ported/fallback`
- Foundry project: yes

### Sources (`src/`)

- `FallbackArgument.sol`: Fallback Argument
- `FallbackOrReceive.sol`: Fallback Or Receive
- `FallbackReturn.sol`: Fallback Return
- `FallbackReturnData.sol`: Fallback Return Data
- `ShortDataCallsFallback.sol`: Short Data Calls Fallback

### Tests (`test/`)

- `FallbackArgument.t.sol`: Fallback Argument.t
- `FallbackOrReceive.t.sol`: Fallback Or Receive.t
- `FallbackReturn.t.sol`: Fallback Return.t
- `FallbackReturnData.t.sol`: Fallback Return Data.t
- `ShortDataCallsFallback.t.sol`: Short Data Calls Fallback.t

## hashing

- Path: `crates/codegen/testdata-ported/hashing`
- Foundry project: yes

### Sources (`src/`)

- `HashBuiltins.sol`: Hash Builtins
- `Hashing.sol`: Hashing

### Tests (`test/`)

- `HashBuiltins.t.sol`: Hash Builtins.t
- `Hashing.t.sol`: Hashing.t

## immutable

- Path: `crates/codegen/testdata-ported/immutable`
- Foundry project: yes

### Sources (`src/`)

- `ReadInConstructor.sol`: Read In Constructor

### Tests (`test/`)

- `ReadInConstructor.t.sol`: Read In Constructor.t

## inheritance

- Path: `crates/codegen/testdata-ported/inheritance`
- Foundry project: yes

### Sources (`src/`)

- `ConstructorInitOrder.sol`: Constructor Init Order
- `Inheritance.sol`: Inheritance
- `InheritedFunction.sol`: Inherited Function
- `InheritedMapping.sol`: Inherited Mapping
- `StateVariablesInitOrder.sol`: State Variables Init Order
- `SuperInConstructor.sol`: Super In Constructor

### Tests (`test/`)

- `ConstructorInitOrder.t.sol`: Constructor Init Order.t
- `Inheritance.t.sol`: Inheritance.t
- `InheritedFunction.t.sol`: Inherited Function.t
- `InheritedMapping.t.sol`: Inherited Mapping.t
- `StateVariablesInitOrder.t.sol`: State Variables Init Order.t
- `SuperInConstructor.t.sol`: Super In Constructor.t

## interfaces

- Path: `crates/codegen/testdata-ported/interfaces`
- Foundry project: yes

### Sources (`src/`)

- `Interface.sol`: Interface

### Tests (`test/`)

- `Interface.t.sol`: Interface.t

## libraries

- Path: `crates/codegen/testdata-ported/libraries`
- Foundry project: yes

### Sources (`src/`)

- `InternalLibraryFunction.sol`: Internal Library Function
- `InternalLibraryFunctionAttachedToAddress.sol`: Internal Library Function Attached To Address
- `InternalLibraryFunctionAttachedToArrayNamedPopPush.sol`: Internal Library Function Attached To Array Named Pop Push
- `InternalLibraryFunctionAttachedToBool.sol`: Internal Library Function Attached To Bool
- `InternalLibraryFunctionAttachedToContract.sol`: Internal Library Function Attached To Contract
- `InternalLibraryFunctionAttachedToDynamicArray.sol`: Internal Library Function Attached To Dynamic Array
- `InternalLibraryFunctionAttachedToEnum.sol`: Internal Library Function Attached To Enum
- `InternalLibraryFunctionAttachedToFixedBytes.sol`: Internal Library Function Attached To Fixed Bytes
- `InternalLibraryFunctionAttachedToInteger.sol`: Internal Library Function Attached To Integer
- `InternalLibraryFunctionAttachedToLiteral.sol`: Internal Library Function Attached To Literal
- `InternalLibraryFunctionAttachedToStringMemory.sol`: Internal Library Function Attached To String Memory
- `OverloadLib.sol`: Overload Lib
- `SafeMath.sol`: Safe Math

### Tests (`test/`)

- `InternalLibraryFunction.t.sol`: Internal Library Function.t
- `InternalLibraryFunctionAttachedToAddress.t.sol`: Internal Library Function Attached To Address.t
- `InternalLibraryFunctionAttachedToArrayNamedPopPush.t.sol`: Internal Library Function Attached To Array Named Pop Push.t
- `InternalLibraryFunctionAttachedToBool.t.sol`: Internal Library Function Attached To Bool.t
- `InternalLibraryFunctionAttachedToContract.t.sol`: Internal Library Function Attached To Contract.t
- `InternalLibraryFunctionAttachedToDynamicArray.t.sol`: Internal Library Function Attached To Dynamic Array.t
- `InternalLibraryFunctionAttachedToEnum.t.sol`: Internal Library Function Attached To Enum.t
- `InternalLibraryFunctionAttachedToFixedBytes.t.sol`: Internal Library Function Attached To Fixed Bytes.t
- `InternalLibraryFunctionAttachedToInteger.t.sol`: Internal Library Function Attached To Integer.t
- `InternalLibraryFunctionAttachedToLiteral.t.sol`: Internal Library Function Attached To Literal.t
- `InternalLibraryFunctionAttachedToStringMemory.t.sol`: Internal Library Function Attached To String Memory.t
- `OverloadLib.t.sol`: Overload Lib.t
- `SafeMath.t.sol`: Safe Math.t

## literals

- Path: `crates/codegen/testdata-ported/literals`
- Foundry project: yes

### Sources (`src/`)

- `Denominations.sol`: Denominations
- `EtherLiteral.sol`: Ether Literal
- `FractionalDenominations.sol`: Fractional Denominations
- `GweiLiteral.sol`: Gwei Literal
- `ScientificNotation.sol`: Scientific Notation
- `WeiLiteral.sol`: Wei Literal

### Tests (`test/`)

- `Denominations.t.sol`: Denominations.t
- `EtherLiteral.t.sol`: Ether Literal.t
- `FractionalDenominations.t.sol`: Fractional Denominations.t
- `GweiLiteral.t.sol`: Gwei Literal.t
- `ScientificNotation.t.sol`: Scientific Notation.t
- `WeiLiteral.t.sol`: Wei Literal.t

## loop_optimization

- Path: `crates/codegen/testdata-ported/loop_optimization`
- Foundry project: no

## low-level-calls

- Path: `crates/codegen/testdata-ported/low-level-calls`
- Foundry project: yes

### Sources (`src/`)

- `LowLevelCalls.sol`: Low Level Calls

### Tests (`test/`)

- `LowLevelCalls.t.sol`: Low Level Calls.t

## memory-management

- Path: `crates/codegen/testdata-ported/memory-management`
- Foundry project: yes

### Sources (`src/`)

- `MemoryTypesInitialization.sol`: Memory Types Initialization

### Tests (`test/`)

- `MemoryTypesInitialization.t.sol`: Memory Types Initialization.t

## modifiers

- Path: `crates/codegen/testdata-ported/modifiers`
- Foundry project: yes

### Sources (`src/`)

- `EvaluationOrder.sol`: Evaluation Order
- `FunctionModifier.sol`: Function Modifier
- `FunctionModifierLoop.sol`: Function Modifier Loop
- `FunctionModifierMultiInvocation.sol`: Function Modifier Multi Invocation
- `FunctionModifierMultipleTimes.sol`: Function Modifier Multiple Times
- `Modifiers.sol`: Modifiers
- `ReturnInModifier.sol`: Return In Modifier

### Tests (`test/`)

- `EvaluationOrder.t.sol`: Evaluation Order.t
- `FunctionModifier.t.sol`: Function Modifier.t
- `FunctionModifierLoop.t.sol`: Function Modifier Loop.t
- `FunctionModifierMultiInvocation.t.sol`: Function Modifier Multi Invocation.t
- `FunctionModifierMultipleTimes.t.sol`: Function Modifier Multiple Times.t
- `Modifiers.t.sol`: Modifiers.t
- `ReturnInModifier.t.sol`: Return In Modifier.t

## multi-return

- Path: `crates/codegen/testdata-ported/multi-return`
- Foundry project: yes

### Sources (`src/`)

- `MultiReturn.sol`: Multi Return

### Tests (`test/`)

- `MultiReturn.t.sol`: Multi Return.t

## multicall

- Path: `crates/codegen/testdata-ported/multicall`
- Foundry project: yes

### Sources (`src/`)

- `Counter.sol`: Counter
- `Multicall.sol`: Multicall

### Tests (`test/`)

- `Multicall.t.sol`: Multicall.t

## operators

- Path: `crates/codegen/testdata-ported/operators`
- Foundry project: yes

### Sources (`src/`)

- `ShiftLeft.sol`: Shift Left
- `ShiftRight.sol`: Shift Right

### Tests (`test/`)

- `ShiftLeft.t.sol`: Shift Left.t
- `ShiftRight.t.sol`: Shift Right.t

## payable

- Path: `crates/codegen/testdata-ported/payable`
- Foundry project: yes

### Sources (`src/`)

- `NoNonpayableCircumventionByModifier.sol`: No Nonpayable Circumvention By Modifier

### Tests (`test/`)

- `NoNonpayableCircumventionByModifier.t.sol`: No Nonpayable Circumvention By Modifier.t

## receive

- Path: `crates/codegen/testdata-ported/receive`
- Foundry project: yes

### Sources (`src/`)

- `EmptyCalldataCallsReceive.sol`: Empty Calldata Calls Receive
- `EtherAndData.sol`: Ether And Data
- `ReceiveInherited.sol`: Receive Inherited

### Tests (`test/`)

- `EmptyCalldataCallsReceive.t.sol`: Empty Calldata Calls Receive.t
- `EtherAndData.t.sol`: Ether And Data.t
- `ReceiveInherited.t.sol`: Receive Inherited.t

## receive-fallback

- Path: `crates/codegen/testdata-ported/receive-fallback`
- Foundry project: yes

### Sources (`src/`)

- `ReceiveFallback.sol`: Receive Fallback

### Tests (`test/`)

- `ReceiveFallback.t.sol`: Receive Fallback.t

## revert-strings

- Path: `crates/codegen/testdata-ported/revert-strings`
- Foundry project: yes

### Sources (`src/`)

- `EtherNonPayableFunction.sol`: Ether Non Payable Function
- `UnknownSigNoFallback.sol`: Unknown Sig No Fallback

### Tests (`test/`)

- `EtherNonPayableFunction.t.sol`: Ether Non Payable Function.t
- `UnknownSigNoFallback.t.sol`: Unknown Sig No Fallback.t

## reverts

- Path: `crates/codegen/testdata-ported/reverts`
- Foundry project: yes

### Sources (`src/`)

- `AssertRequire.sol`: Assert Require
- `RevertBasics.sol`: Revert Basics
- `SimpleThrow.sol`: Simple Throw

### Tests (`test/`)

- `AssertRequire.t.sol`: Assert Require.t
- `RevertBasics.t.sol`: Revert Basics.t
- `SimpleThrow.t.sol`: Simple Throw.t

## scoping

- Path: `crates/codegen/testdata-ported/scoping`
- Foundry project: yes

### Sources (`src/`)

- `C99ScopingActivation.sol`: C99 Scoping Activation

### Tests (`test/`)

- `C99ScopingActivation.t.sol`: C99 Scoping Activation.t

## stack-deep

- Path: `crates/codegen/testdata-ported/stack-deep`
- Foundry project: yes

### Sources (`src/`)

- `Showcase.sol`: Showcase
- `StackDeep.sol`: Stack Deep

### Tests (`test/`)

- `Showcase.t.sol`: Showcase.t
- `StackDeep.t.sol`: Stack Deep.t

## statements

- Path: `crates/codegen/testdata-ported/statements`
- Foundry project: yes

### Sources (`src/`)

- `DoWhileLoopContinue.sol`: Do While Loop Continue
- `EmptyForLoop.sol`: Empty For Loop

### Tests (`test/`)

- `DoWhileLoopContinue.t.sol`: Do While Loop Continue.t
- `EmptyForLoop.t.sol`: Empty For Loop.t

## storage

- Path: `crates/codegen/testdata-ported/storage`
- Foundry project: yes

### Sources (`src/`)

- `AccessorsMappingForArray.sol`: Accessors Mapping For Array
- `ArrayAccessor.sol`: Array Accessor
- `ComplexAccessors.sol`: Complex Accessors
- `DynamicArray.sol`: Dynamic Array
- `MappingEdgeCases.sol`: Mapping Edge Cases
- `MappingState.sol`: Mapping State
- `MappingStringKey.sol`: Mapping String Key
- `NestedMapping.sol`: Nested Mapping
- `PackedStorageOverflow.sol`: Packed Storage Overflow
- `PackedStorageSigned.sol`: Packed Storage Signed
- `PackedStorageStructsBytes.sol`: Packed Storage Structs Bytes
- `PackedStorageStructsEnum.sol`: Packed Storage Structs Enum
- `PackedStorageStructsUint.sol`: Packed Storage Structs Uint
- `Payable.sol`: Payable
- `SimpleAccessor.sol`: Simple Accessor
- `StateSmokeTest.sol`: State Smoke Test
- `StaticArrayCopyCleanup.sol`: Static Array Copy Cleanup
- `StorageInit.sol`: Storage Init
- `StructAccessor.sol`: Struct Accessor
- `ThreeLevelMapping.sol`: Three Level Mapping

### Tests (`test/`)

- `AccessorsMappingForArray.t.sol`: Accessors Mapping For Array.t
- `ArrayAccessor.t.sol`: Array Accessor.t
- `ComplexAccessors.t.sol`: Complex Accessors.t
- `DynamicArray.t.sol`: Dynamic Array.t
- `MappingEdgeCases.t.sol`: Mapping Edge Cases.t
- `MappingState.t.sol`: Mapping State.t
- `MappingStringKey.t.sol`: Mapping String Key.t
- `NestedMapping.t.sol`: Nested Mapping.t
- `PackedStorageOverflow.t.sol`: Packed Storage Overflow.t
- `PackedStorageSigned.t.sol`: Packed Storage Signed.t
- `PackedStorageStructsBytes.t.sol`: Packed Storage Structs Bytes.t
- `PackedStorageStructsEnum.t.sol`: Packed Storage Structs Enum.t
- `PackedStorageStructsUint.t.sol`: Packed Storage Structs Uint.t
- `Payable.t.sol`: Payable.t
- `SimpleAccessor.t.sol`: Simple Accessor.t
- `StateSmokeTest.t.sol`: State Smoke Test.t
- `StaticArrayCopyCleanup.t.sol`: Static Array Copy Cleanup.t
- `StorageInit.t.sol`: Storage Init.t
- `StructAccessor.t.sol`: Struct Accessor.t
- `ThreeLevelMapping.t.sol`: Three Level Mapping.t

## stress-arrays

- Path: `crates/codegen/testdata-ported/stress-arrays`
- Foundry project: yes

### Sources (`src/`)

- `StressArrays.sol`: Stress Arrays

### Tests (`test/`)

- `StressArrays.t.sol`: Stress Arrays.t

## stress-control-flow

- Path: `crates/codegen/testdata-ported/stress-control-flow`
- Foundry project: yes

### Sources (`src/`)

- `StressControlFlow.sol`: Stress Control Flow

### Tests (`test/`)

- `StressControlFlow.t.sol`: Stress Control Flow.t

## stress-events

- Path: `crates/codegen/testdata-ported/stress-events`
- Foundry project: yes

### Sources (`src/`)

- `StressEvents.sol`: Stress Events

### Tests (`test/`)

- `StressEvents.t.sol`: Stress Events.t

## stress-functions

- Path: `crates/codegen/testdata-ported/stress-functions`
- Foundry project: yes

### Sources (`src/`)

- `StressFunctions.sol`: Stress Functions

### Tests (`test/`)

- `StressFunctions.t.sol`: Stress Functions.t

## stress-inheritance

- Path: `crates/codegen/testdata-ported/stress-inheritance`
- Foundry project: yes

### Sources (`src/`)

- `StressInheritance.sol`: Stress Inheritance

### Tests (`test/`)

- `StressInheritance.t.sol`: Stress Inheritance.t

## stress-mappings

- Path: `crates/codegen/testdata-ported/stress-mappings`
- Foundry project: yes

### Sources (`src/`)

- `StressMappings.sol`: Stress Mappings

### Tests (`test/`)

- `StressMappings.t.sol`: Stress Mappings.t

## stress-modifiers

- Path: `crates/codegen/testdata-ported/stress-modifiers`
- Foundry project: yes

### Sources (`src/`)

- `StressModifiers.sol`: Stress Modifiers

### Tests (`test/`)

- `StressModifiers.t.sol`: Stress Modifiers.t

## strings

- Path: `crates/codegen/testdata-ported/strings`
- Foundry project: yes

### Sources (`src/`)

- `ConstantStringLiteral.sol`: Constant String Literal
- `EmptyString.sol`: Empty String
- `EmptyStringInput.sol`: Empty String Input
- `ReturnString.sol`: Return String

### Tests (`test/`)

- `ConstantStringLiteral.t.sol`: Constant String Literal.t
- `EmptyString.t.sol`: Empty String.t
- `EmptyStringInput.t.sol`: Empty String Input.t
- `ReturnString.t.sol`: Return String.t

## structs

- Path: `crates/codegen/testdata-ported/structs`
- Foundry project: yes

### Sources (`src/`)

- `DebugStruct.sol`: Debug Struct
- `DeepNested.sol`: Deep Nested
- `DeepNestedSimple.sol`: Deep Nested Simple
- `MemoryStructsReadWrite.sol`: Memory Structs Read Write
- `MinimalStruct.sol`: Minimal Struct
- `NestedMemory.sol`: Nested Memory
- `SimpleMultiStruct.sol`: Simple Multi Struct
- `SimpleStruct.sol`: Simple Struct
- `SimpleStructAllocation.sol`: Simple Struct Allocation
- `StringsInStruct.sol`: Strings In Struct
- `StructAssignReferenceToStruct.sol`: Struct Assign Reference To Struct
- `StructCopy.sol`: Struct Copy
- `StructCopyViaLocal.sol`: Struct Copy Via Local
- `StructDeleteMember.sol`: Struct Delete Member
- `StructNamedConstructor.sol`: Struct Named Constructor
- `StructReference.sol`: Struct Reference
- `StructStoragePushZeroValue.sol`: Struct Storage Push Zero Value
- `Structs.sol`: Structs

### Tests (`test/`)

- `DebugStructTest.t.sol`: Debug Struct Test.t
- `DeepNested.t.sol`: Deep Nested.t
- `DeepNestedSimple.t.sol`: Deep Nested Simple.t
- `MemoryStructsReadWrite.t.sol`: Memory Structs Read Write.t
- `MinimalStructTest.t.sol`: Minimal Struct Test.t
- `NestedMemory.t.sol`: Nested Memory.t
- `SimpleMultiStructTest.t.sol`: Simple Multi Struct Test.t
- `SimpleStructAllocation.t.sol`: Simple Struct Allocation.t
- `SimpleStructTest.t.sol`: Simple Struct Test.t
- `StringsInStruct.t.sol`: Strings In Struct.t
- `StructAssignReferenceToStruct.t.sol`: Struct Assign Reference To Struct.t
- `StructCopy.t.sol`: Struct Copy.t
- `StructCopyViaLocal.t.sol`: Struct Copy Via Local.t
- `StructDeleteMember.t.sol`: Struct Delete Member.t
- `StructNamedConstructor.t.sol`: Struct Named Constructor.t
- `StructReference.t.sol`: Struct Reference.t
- `StructStoragePushZeroValue.t.sol`: Struct Storage Push Zero Value.t
- `Structs.t.sol`: Structs.t

## try-catch

- Path: `crates/codegen/testdata-ported/try-catch`
- Foundry project: yes

### Sources (`src/`)

- `TryCatchSimple.sol`: Try Catch Simple

### Tests (`test/`)

- `TryCatchSimple.t.sol`: Try Catch Simple.t

## unifap-v2

- Path: `crates/codegen/testdata-ported/unifap-v2`
- Foundry project: yes

### Sources (`src/`)

- `UnifapV2Factory.sol`: Unifap V2 Factory
- `UnifapV2Pair.sol`: Unifap V2 Pair
- `UnifapV2Router.sol`: Unifap V2 Router

## unifap-v2-create

- Path: `crates/codegen/testdata-ported/unifap-v2-create`
- Foundry project: yes

### Sources (`src/`)

- `UnifapV2Factory.sol`: Unifap V2 Factory
- `UnifapV2Pair.sol`: Unifap V2 Pair
- `UnifapV2Router.sol`: Unifap V2 Router

### Tests (`test/`)

- `LibraryUsing.t.sol`: Library Using.t
- `MinimalInitializable.t.sol`: Minimal Initializable.t
- `MultiInheritInit.t.sol`: Multi Inherit Init.t

## vault-minimal

- Path: `crates/codegen/testdata-ported/vault-minimal`
- Foundry project: yes

### Sources (`src/`)

- `MockERC20.sol`: Mock ERC20
- `Vault.sol`: Vault

### Tests (`test/`)

- `Vault.t.sol`: Vault.t
