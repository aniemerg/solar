//@ compile-flags: -Ztypeck
contract Test {
    function type() public pure { //~ ERROR: expected identifier, found keyword `type`
    }
}
