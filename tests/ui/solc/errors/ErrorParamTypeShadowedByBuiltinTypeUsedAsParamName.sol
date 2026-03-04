//@ compile-flags: -Ztypeck
contract C {
    error E(int bytes, bytes x); //~ ERROR: expected identifier, found keyword `bytes`
}
