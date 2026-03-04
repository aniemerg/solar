//@ compile-flags: -Ztypeck
contract A {
	uint public foo;
}
contract B {
	function foo() external virtual view returns(uint) { return 5; }
}
contract X is A, B {
	uint public override foo; //~ ERROR: identifier `foo` already declared
}
