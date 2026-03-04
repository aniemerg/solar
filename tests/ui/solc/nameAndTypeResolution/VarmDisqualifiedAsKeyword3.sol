//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        bytesM fail = "now"; //~ ERROR: unresolved symbol `bytesM`
    }
}
