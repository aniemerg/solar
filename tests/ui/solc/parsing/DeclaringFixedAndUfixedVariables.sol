contract A {
    fixed40x40 storeMe; //~ ERROR: unresolved symbol `fixed40x40`
    function f(ufixed x, fixed32x32 y) public { //~ ERROR: unresolved symbol `fixed32x32`
        ufixed8x8 a; //~ ERROR: unresolved symbol `ufixed8x8`
        fixed b;
    }
}
