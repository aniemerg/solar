//@ compile-flags: -Ztypeck
contract c {
    uint a = "abc"; //~ ERROR: mismatched types
}
