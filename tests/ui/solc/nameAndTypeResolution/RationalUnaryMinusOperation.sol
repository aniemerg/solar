//@ compile-flags: -Ztypeck
contract test {
    function f() pure public {
        ufixed16x2 a = 3.25; //~ ERROR: unresolved symbol `ufixed16x2`
        fixed16x2 b = -3.25; //~ ERROR: unresolved symbol `fixed16x2`
        a; b;
    }
}
