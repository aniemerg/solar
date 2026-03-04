//@ compile-flags: -Ztypeck
contract C {
    error e1(uint constant x); //~ ERROR: mutability is not allowed here
    error e2(uint immutable x); //~ ERROR: mutability is not allowed here
}
