//@ compile-flags: -Ztypeck
contract C {
	function f(address a) external view returns (bool success) {
		(success,) = a.call{value: 42}(""); //~ ERROR: tuple components cannot be empty
//~^ ERROR: mismatched types
	}
	function h() external payable {}
	function i() external view {
		this.h{value: 42}();
	}
}
