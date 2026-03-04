//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        address payable a = address(uint160(0)); //~ ERROR: mismatched types
        address payable b = address(bytes20(0)); //~ ERROR: invalid explicit type conversion
//~^ ERROR: mismatched types
        address payable c = address(this); //~ ERROR: mismatched types
    }
}
