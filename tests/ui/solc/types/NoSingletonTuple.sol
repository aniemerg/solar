//@ compile-flags: -Ztypeck
contract C {
	function f() public pure {
		uint a;
		(a,) = (uint(1),); //~ ERROR: tuple components cannot be empty
//~^ ERROR: tuple components cannot be empty
	}
}
