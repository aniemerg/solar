//@ compile-flags: -Ztypeck
contract Test {
	function f() public pure {
        uint[] memory x;
        x.push(1); //~ ERROR: member `push` not found on type `uint256[] memory`
	}
}
