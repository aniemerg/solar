//@ compile-flags: -Ztypeck
error E();

contract C {
    E x; //~ ERROR: name has to refer to a valid user-defined type
}
