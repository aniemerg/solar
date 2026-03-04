//@ compile-flags: -Ztypeck
contract c {
    uint8 a = 1000; //~ ERROR: mismatched types
}
