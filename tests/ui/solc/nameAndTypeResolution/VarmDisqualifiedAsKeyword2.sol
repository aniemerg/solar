//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        intM should = 4; //~ ERROR: unresolved symbol `intM`
    }
}
