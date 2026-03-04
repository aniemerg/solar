//@ compile-flags: -Ztypeck
contract test {
    fixed0x7 a = .3; //~ ERROR: unresolved symbol `fixed0x7`
}
