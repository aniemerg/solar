//@ compile-flags: -Ztypeck
contract C {
    address a;
    function f() public pure returns(bool) {
        a = address(0) + address(0); //~ ERROR: invalid explicit type conversion
//~^ ERROR: invalid explicit type conversion
        a = address(0) - address(0); //~ ERROR: invalid explicit type conversion
//~^ ERROR: invalid explicit type conversion
        a = address(0) * address(0); //~ ERROR: invalid explicit type conversion
//~^ ERROR: invalid explicit type conversion
        a = address(0) / address(0); //~ ERROR: invalid explicit type conversion
//~^ ERROR: invalid explicit type conversion
        return address(0) == address(0); //~ ERROR: invalid explicit type conversion
//~^ ERROR: invalid explicit type conversion
    }
}
