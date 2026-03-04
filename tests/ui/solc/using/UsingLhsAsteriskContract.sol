//@ compile-flags: -Ztypeck
contract C {
    using * for uint; //~ ERROR: expected identifier, found `*`
}
