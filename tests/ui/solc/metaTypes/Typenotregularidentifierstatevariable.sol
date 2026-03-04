//@ compile-flags: -Ztypeck
contract Test {
    uint type; //~ ERROR: expected identifier, found keyword `type`
}
