//@ compile-flags: -Ztypeck
contract C {
    uint storage transient x; //~ ERROR: data location already specified
}
