//@ compile-flags: -Ztypeck
contract C {
	function f() internal pure {}
	function g() internal pure returns (uint256) {}
	function h() internal pure returns (uint256, uint256) {}
	function test() public pure {
		f() = (); //~ ERROR: expression has to be an lvalue
		g() = (uint256(1)); //~ ERROR: expression has to be an lvalue
		h() = (uint256(1), uint256(2)); //~ ERROR: expression has to be an lvalue
		h() = (); //~ ERROR: expression has to be an lvalue
//~^ ERROR: mismatched types
	}
}
