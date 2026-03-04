//@ compile-flags: -Ztypeck
contract A {
	function foo() external virtual view returns(uint) { return 5; }
}
contract B is A {
	uint public override foo;
}
contract C is A {
	function foo() external virtual override view returns(uint) { return 5; }
}
contract X is B, C {
	uint public override foo; //~ ERROR: identifier `foo` already declared
}
