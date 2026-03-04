//@ compile-flags: -Ztypeck
contract A {
	function foo() internal returns (uint256);
}
contract X {
	int public override() testvar; //~ ERROR: expected identifier, found `)`
}
