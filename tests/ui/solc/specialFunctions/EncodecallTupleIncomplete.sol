//@ compile-flags: -Ztypeck
contract C {
	function f(int a) public {}
	function failFunctionArgsIntLiteralTuple() public returns(bytes memory) {
		return abi.encodeCall(this.f, (1,)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: tuple components cannot be empty
	}
}
