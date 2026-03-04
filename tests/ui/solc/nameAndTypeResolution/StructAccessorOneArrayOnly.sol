//@ compile-flags: -Ztypeck
contract test {
    struct Data { uint[15] m_array; }
    Data public data; //~ ERROR: getter must return at least one value
}
