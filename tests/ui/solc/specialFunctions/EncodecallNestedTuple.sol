//@ compile-flags: -Ztypeck
contract C {
	function f(int a, int b) public {}
	function failFunctionArgsIntLiteralNestedTuple() public returns(bytes memory) {
		return abi.encodeCall(this.f, ((1,2))); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
	}
}
