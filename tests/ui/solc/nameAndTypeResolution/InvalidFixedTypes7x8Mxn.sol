//@ compile-flags: -Ztypeck
contract test {
    fixed7x8 c = 3.12345678; //~ ERROR: unresolved symbol `fixed7x8`
}
