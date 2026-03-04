//@ compile-flags: -Ztypeck
contract c {
    uint constant a = 1;
    function f() public { a = 2; } //~ ERROR: cannot assign to a constant variable
}
