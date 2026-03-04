//@ compile-flags: -Ztypeck
contract C {
	function f() public pure returns (uint, uint, bytes32) {
		uint a;
		bytes32 b;
		(a,) = f(); //~ ERROR: tuple components cannot be empty
		(,b) = f(); //~ ERROR: tuple components cannot be empty
	}
}
