//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        ufixed a = 11/4;
        ufixed248x8 b = a; b; //~ ERROR: unresolved symbol `ufixed248x8`
    }
}
