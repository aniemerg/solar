//@ compile-flags: -Ztypeck
contract A {
	function foo() internal returns (uint256);
}
contract X {
	int public override(A,) testvar; //~ ERROR: trailing `,` separator is not allowed
}
