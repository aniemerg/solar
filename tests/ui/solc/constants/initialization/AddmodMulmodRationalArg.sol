//@ compile-flags: -Ztypeck
contract C {
    uint constant a = addmod(3, 4, 0.1); //~ ERROR: rational literals are not supported
    uint constant b = mulmod(3, 4, 0.1); //~ ERROR: rational literals are not supported
}
