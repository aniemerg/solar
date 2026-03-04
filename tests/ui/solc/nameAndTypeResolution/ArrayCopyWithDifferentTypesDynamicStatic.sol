//@ compile-flags: -Ztypeck
contract c {
    uint[] a;
    uint[80] b;
    function f() public { b = a; } //~ ERROR: mismatched types
}
