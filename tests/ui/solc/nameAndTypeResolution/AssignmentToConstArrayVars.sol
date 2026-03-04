//@ compile-flags: -Ztypeck
contract C {
    uint[3] constant x = [uint(1), 2, 3]; //~ ERROR: mismatched types
}
