//@ compile-flags: -Ztypeck
contract A {
	uint public x;
}
contract C is A {
	function x() public returns (uint) {} //~ ERROR: identifier `x` already declared
}
