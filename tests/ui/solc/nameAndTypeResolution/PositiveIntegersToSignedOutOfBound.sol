//@ compile-flags: -Ztypeck
contract test {
    int8 public j = 128; //~ ERROR: mismatched types
}
