//@ compile-flags: -Ztypeck
contract Other {
    function f(uint) public pure returns (uint) {}
}
contract SuperTest is Other {
	function creationSuper() public pure returns (bytes memory) {
		return type(super).creationCode; //~ ERROR: expected item, found builtin
	}
	function runtimeOther() public pure returns (bytes memory) {
		return type(super).runtimeCode; //~ ERROR: expected item, found builtin
	}
}
