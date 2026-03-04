//@ compile-flags: -Ztypeck
contract A {
    event X(uint, uint indexed);
}
contract B {
    event X(uint, uint); //~ ERROR: event with same name and parameter types declared twice
}
contract C is A, B {
}
