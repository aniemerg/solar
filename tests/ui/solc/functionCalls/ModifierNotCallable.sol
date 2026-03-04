//@ compile-flags: -Ztypeck
contract C {
    uint a = m(1000); //~ ERROR: mismatched types

    modifier m(uint) { _; }
}
