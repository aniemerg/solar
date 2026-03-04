//@ compile-flags: -Ztypeck
contract C {
    uint transient storage x; //~ ERROR: data location already specified
}
