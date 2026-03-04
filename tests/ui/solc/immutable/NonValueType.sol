//@ compile-flags: -Ztypeck
contract C {
    uint[] immutable x; //~ ERROR: immutable variables cannot have a non-value type
}
