//@ compile-flags: -Ztypeck
contract test {
    uint8 public x = 700; //~ ERROR: mismatched types
}
