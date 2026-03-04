//@ compile-flags: -Ztypeck
contract Test {
    function f(uint type) public pure { //~ ERROR: expected identifier, found keyword `type`
    }
}
