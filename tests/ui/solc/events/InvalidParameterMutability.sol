//@ compile-flags: -Ztypeck
contract test {
    event e1(uint constant a); //~ ERROR: mutability is not allowed here
    event e2(uint immutable a); //~ ERROR: mutability is not allowed here
}
