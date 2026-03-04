//@ compile-flags: -Ztypeck
contract A { }
contract B is A {
    function f() public { B b = A(address(1)); } //~ ERROR: invalid explicit type conversion
//~^ ERROR: mismatched types
}
