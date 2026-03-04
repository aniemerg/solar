//@ compile-flags: -Ztypeck
contract A {
    event X(uint);
}
contract B is A {
    event X(uint); //~ ERROR: event with same name and parameter types declared twice
}
