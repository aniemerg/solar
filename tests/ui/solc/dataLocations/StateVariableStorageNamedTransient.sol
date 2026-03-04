//@ compile-flags: -Ztypeck
contract C {
    uint storage transient; //~ ERROR: data location can only be specified for array, struct or mapping types
}
