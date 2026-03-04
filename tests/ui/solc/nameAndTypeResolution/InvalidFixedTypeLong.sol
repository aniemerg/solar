//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        fixed8x888888888888888888888888888888888888888888888888888 b; //~ ERROR: unresolved symbol `fixed8x888888888888888888888888888888888888888888888888888`
    }
}
