//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        uint99999999999999999999999999 something = 3; //~ ERROR: unresolved symbol `uint99999999999999999999999999`
    }
}
