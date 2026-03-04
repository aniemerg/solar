//@ compile-flags: -Ztypeck
abstract contract A {
	function test() private virtual returns (uint256); //~ ERROR: "virtual" and "private" cannot be used together
}
abstract contract X is A {
	function test() private override returns (uint256) {}
}
