//@ compile-flags: -Ztypeck
contract test {
    uint8 public x = -1; //~ ERROR: mismatched types
}
