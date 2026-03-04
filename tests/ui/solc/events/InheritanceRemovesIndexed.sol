//@ compile-flags: -Ztypeck
contract A {
    event X(uint, uint indexed);
}
contract B is A {
    event X(uint, uint); //~ ERROR: event with same name and parameter types declared twice
}
