//@ compile-flags: -Ztypeck
contract C {
    uint[2**256] x; //~ ERROR: failed to evaluate constant: arithmetic overflow
}
