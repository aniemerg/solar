//@ compile-flags: -Ztypeck
contract test {
    fixed99999999999999999999999999999999999999x7 b = 9.5; //~ ERROR: unresolved symbol `fixed99999999999999999999999999999999999999x7`
}
