//@ compile-flags: -Ztypeck
contract c {
    a[] public foo; //~ ERROR: unresolved symbol `a`
}
