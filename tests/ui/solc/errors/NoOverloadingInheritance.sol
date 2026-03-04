//@ compile-flags: -Ztypeck
contract A {
    error Err(uint);
}
contract B is A {
    error Err(bytes32); //~ ERROR: identifier `Err` already declared
}
