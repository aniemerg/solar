//@ compile-flags: -Ztypeck
contract C {
	function f(int a) public {}
	function f3(int a, int b) public {}

	function failFunctionArgsWrongType() public returns(bytes memory) {
		return abi.encodeCall(this.f, ("test")); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
	}
	function failFunctionArgsTooMany() public returns(bytes memory) {
		return abi.encodeCall(this.f, (1, 2)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
	}
	function failFunctionArgsTooFew0() public returns(bytes memory) {
		return abi.encodeCall(this.f, ()); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
	}
	function failFunctionArgsTooFew1() public returns(bytes memory) {
		return abi.encodeCall(this.f); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
	}
	function failFunctionArgsArrayLiteral() public returns(bytes memory) {
		return abi.encodeCall(this.f3, [1, 2]); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
	}
}
