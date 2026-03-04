//@ compile-flags: -Ztypeck
contract C {
    event e(string indexed transient a); //~ ERROR: data locations are not allowed here
}
