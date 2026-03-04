//@ compile-flags: -Ztypeck
contract TestIt {
    event A();
    event A(uint i);
}
