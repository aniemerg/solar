//@ compile-flags: -Ztypeck
contract D { }
contract C {
    using D for uint; //~ ERROR: using directive must reference a library
}
