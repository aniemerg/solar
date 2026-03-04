//@ compile-flags: -Ztypeck
contract A {
	function foo() internal returns (uint256);
}
contract X {
	function foo() internal override(X, address) returns (uint256); //~ ERROR: expected identifier, found keyword `address`
}
