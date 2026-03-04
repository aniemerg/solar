//@ compile-flags: -Ztypeck
contract C {
    function f() public pure returns (address) {
        return address(-1); //~ ERROR: invalid explicit type conversion
    }
    function g() public pure returns (address) {
        return -1;
    }
	function h() public pure returns (address) {
		return address(2**160); //~ ERROR: invalid explicit type conversion
	}
}
