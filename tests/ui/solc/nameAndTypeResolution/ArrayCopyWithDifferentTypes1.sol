//@ compile-flags: -Ztypeck
contract c {
    bytes a;
    uint[] b;
    function f() public { b = a; } //~ ERROR: mismatched types
}
