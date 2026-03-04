//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        ufixed256x1 a = 1/3; a; //~ ERROR: unresolved symbol `ufixed256x1`
    }
}
