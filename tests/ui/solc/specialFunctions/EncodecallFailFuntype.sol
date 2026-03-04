//@ compile-flags: -Ztypeck
interface I {
	function fExternal(uint256 p, string memory t) external;
}

contract Other {
	function fExternal(uint) external pure {}
	function fPublic(uint) public pure {}
	function fInternal(uint) internal pure {}
}

library L {
	function fExternal(uint256 p, string memory t) external {}
	function fInternal(uint256 p, string memory t) internal {}
}

contract Base {
	function baseFunctionInternal(uint) internal pure {}
	function baseFunctionPublic(uint) public pure {}
}

function fileLevel(uint) pure {}

contract C is Base {
	using L for uint256;

	function fPublic(int a) public {}
	function fInternal(uint256 p, string memory t) internal {}

	function failFunctionPtrMissing() public returns(bytes memory) {
		return abi.encodeCall(1, this.fPublic); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
	}
	function failFunctionPtrWrongType() public returns(bytes memory) {
		return abi.encodeCall(abi.encodeCall, (1, 2, 3, "test")); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
	}
	function failFunctionInternal() public returns(bytes memory) {
		return abi.encodeCall(fInternal, (1, "123")); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
	}
	function failFunctionInternalFromVariable() public returns(bytes memory) {
		function(uint256, string memory) internal localFunctionPointer = fInternal;
		return abi.encodeCall(localFunctionPointer, (1, "123")); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
	}
	function failLibraryPointerCall() public {
		abi.encodeCall(L.fInternal, (1, "123")); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: member `fInternal` not found on type `type(library L)`
		abi.encodeCall(L.fExternal, (1, "123")); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: member `fExternal` not found on type `type(library L)`
	}
	function failAttachedLibraryPointerCall() public returns (bytes memory) {
		uint256 x = 1;
		return abi.encodeCall(x.fExternal, (1, "123")); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: member `fExternal` not found on type `uint256`
	}
	function viaBaseDeclaration() public pure returns (bytes memory) {
		return abi.encodeCall(C.fPublic, (2)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: member `fPublic` not found on type `type(contract C)`
	}
	function viaBaseDeclaration2() public pure returns (bytes memory) {
		return bytes.concat( //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
			abi.encodeCall(Base.baseFunctionPublic, (1)), //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: member `baseFunctionPublic` not found on type `type(contract Base)`
			abi.encodeCall(Base.baseFunctionInternal, (1)) //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: member `baseFunctionInternal` not found on type `type(contract Base)`
		);
	}
	function fileLevelFunction() public pure returns (bytes memory) {
		return abi.encodeCall(fileLevel, (2)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
	}
	function createFunction() public pure returns (bytes memory) {
		return abi.encodeCall(new Other, (2)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
	}
}
