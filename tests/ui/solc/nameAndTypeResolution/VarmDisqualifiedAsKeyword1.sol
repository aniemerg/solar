//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        uintM something = 3; //~ ERROR: unresolved symbol `uintM`
    }
}
