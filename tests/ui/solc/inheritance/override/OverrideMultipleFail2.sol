//@ compile-flags: -Ztypeck
contract A {
	function foo() internal returns (uint256);
}
contract X {
	function test() internal override(,) returns (uint256); //~ ERROR: expected identifier, found `,`
}
