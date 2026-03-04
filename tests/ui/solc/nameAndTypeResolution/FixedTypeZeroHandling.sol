//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        fixed16x2 a = 0; a; //~ ERROR: unresolved symbol `fixed16x2`
        ufixed32x1 b = 0; b; //~ ERROR: unresolved symbol `ufixed32x1`
    }
}
