//@ compile-flags: -Ztypeck
contract C {
    uint[3/0] ids; //~ ERROR: failed to evaluate constant: attempted to divide by zero
}
