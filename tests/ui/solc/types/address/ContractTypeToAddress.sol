//@ compile-flags: -Ztypeck
interface I {}

library L {}

contract C {
    function f() public pure {
        address(C); //~ ERROR: invalid explicit type conversion
        address(I); //~ ERROR: invalid explicit type conversion
        address(L); // This one is allowed
//~^ ERROR: invalid explicit type conversion

        address(type(C)); //~ ERROR: invalid explicit type conversion
        address(type(I)); //~ ERROR: invalid explicit type conversion
        address(type(L)); //~ ERROR: invalid explicit type conversion
    }
}
