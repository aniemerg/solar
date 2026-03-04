//@ compile-flags: -Ztypeck
contract test {
    event A(uint i); //~ ERROR: event with same name and parameter types declared twice
    event A(uint i) anonymous;
}
