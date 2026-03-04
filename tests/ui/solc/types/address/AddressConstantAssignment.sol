//@ compile-flags: -Ztypeck
contract C {
    address constant a = address(0); //~ ERROR: invalid explicit type conversion
    address payable constant b = payable(0); //~ ERROR: invalid explicit type conversion
    function f() public {
        a = address(0); //~ ERROR: cannot assign to a constant variable
//~^ ERROR: invalid explicit type conversion
        b = payable(0); //~ ERROR: cannot assign to a constant variable
//~^ ERROR: invalid explicit type conversion
    }
}
