//@ compile-flags: -Ztypeck
contract C {
    uint[1.111111E1111111111111] ids; //~ ERROR: exponent too large
}
