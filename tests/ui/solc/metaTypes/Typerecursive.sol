//@ compile-flags: -Ztypeck
contract Test {
    function f() public pure {
        type(type(type(Test))); //~ ERROR: expected identifier, found keyword `type`
//~^ ERROR: expected one of `)` or `[`, found `(`
    }
}
