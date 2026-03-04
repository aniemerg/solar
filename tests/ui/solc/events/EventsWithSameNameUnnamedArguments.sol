//@ compile-flags: -Ztypeck
contract test {
    event A(uint);
    event A(uint, uint);
}
