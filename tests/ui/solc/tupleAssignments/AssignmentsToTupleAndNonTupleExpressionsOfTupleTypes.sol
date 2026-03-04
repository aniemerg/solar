//@ compile-flags: -Ztypeck
contract C {
	uint[] public array;

	function f() public {
		// (f()) is not a tuple expression, but its value is a tuple.
		(f()) = (); //~ ERROR: expression has to be an lvalue
//~^ ERROR: tuple components cannot be empty
	}

	function g() public {
		// (revert()) is not a tuple expression, but its value is a tuple.
		(revert()) = (); //~ ERROR: no matching declarations found
//~^ ERROR: expression has to be an lvalue
	}

	function h() internal returns (uint, uint) {}

	function i() public {
		// (h()) is not a tuple expression, but its value is a tuple (uint, uint).
		(h()) = (1, 1); //~ ERROR: expression has to be an lvalue
	}

	function j() public returns (uint, uint) {
		// (j()) is not a tuple expression, but its value is a tuple (uint, uint).
		(j()) = (1, 1); //~ ERROR: expression has to be an lvalue
	}

	function m() public {
		// (uint x, uint y) is a tuple expression, and its value is a tuple (uint, uint).
		(uint x, uint y) = (1, 1);
	}

	function n() public {
		// ((array.push(), array.push())) is not a tuple expression, but contains a tuple expression, and the value of both is a tuple (pointer uint, pointer uint).
		((array.push(), array.push())) = (1, 1); //~ ERROR: member `push` not unique on type `uint256[] storage`
//~^ ERROR: expression has to be an lvalue
//~^^ ERROR: member `push` not unique on type `uint256[] storage`
//~^^^ ERROR: expression has to be an lvalue
	}
}
