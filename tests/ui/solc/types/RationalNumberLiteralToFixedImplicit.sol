//@ compile-flags: -Ztypeck
contract C {
    function literalToUFixed() public pure {
        ufixed8x2 a = 0.10; //~ ERROR: unresolved symbol `ufixed8x2`
        ufixed8x2 b = 0.00; //~ ERROR: unresolved symbol `ufixed8x2`
        ufixed8x2 c = 2.55; //~ ERROR: unresolved symbol `ufixed8x2`
        a; b; c;
    }
    function literalToFixed() public pure {
        fixed8x1 a =   0.1; //~ ERROR: unresolved symbol `fixed8x1`
        fixed8x1 b =  12.7; //~ ERROR: unresolved symbol `fixed8x1`
        fixed8x1 c = -12.8; //~ ERROR: unresolved symbol `fixed8x1`
        a; b; c;
    }
}
