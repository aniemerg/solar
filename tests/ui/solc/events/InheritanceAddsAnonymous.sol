//@ compile-flags: -Ztypeck
contract A {
    event X();
}
contract B is A {
    event X() anonymous; //~ ERROR: event with same name and parameter types declared twice
}
