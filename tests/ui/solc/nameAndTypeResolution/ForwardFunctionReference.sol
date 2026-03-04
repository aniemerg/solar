//@ compile-flags: -Ztypeck
contract First {
    function fun() public returns (bool) {
        return Second(address(1)).fun(1, true, 3) > 0; //~ ERROR: invalid explicit type conversion
    }
}
contract Second {
    function fun(uint, bool, uint) public returns (uint) {
        if (First(address(2)).fun() == true) return 1; //~ ERROR: invalid explicit type conversion
    }
}
