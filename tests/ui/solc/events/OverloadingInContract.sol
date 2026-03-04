//@ compile-flags: -Ztypeck
contract A {
    event X();
    event X(uint);
}
