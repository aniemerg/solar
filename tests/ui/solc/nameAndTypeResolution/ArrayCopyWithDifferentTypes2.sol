//@ compile-flags: -Ztypeck
contract c {
    uint32[] a;
    uint8[] b;
    function f() public { b = a; } //~ ERROR: mismatched types
}
