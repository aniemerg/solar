//@ compile-flags: -Ztypeck
contract A {
    function f() pure public {
        ufixed16x2 a = 0.5; //~ ERROR: unresolved symbol `ufixed16x2`
        ufixed256x52 b = 0.0000000000000006661338147750939242541790008544921875; //~ ERROR: unresolved symbol `ufixed256x52`
        fixed16x2 c = -0.5; //~ ERROR: unresolved symbol `fixed16x2`
        fixed256x52 d = -0.0000000000000006661338147750939242541790008544921875; //~ ERROR: unresolved symbol `fixed256x52`
        a; b; c; d;
    }
}
