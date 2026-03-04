//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        ufixed64x8 a = 3.5 * 3; //~ ERROR: unresolved symbol `ufixed64x8`
        ufixed64x8 b = 4 - 2.5; //~ ERROR: unresolved symbol `ufixed64x8`
        ufixed64x8 c = 11 / 4; //~ ERROR: unresolved symbol `ufixed64x8`
        ufixed240x5 d = 599 + 0.21875; //~ ERROR: unresolved symbol `ufixed240x5`
        ufixed256x80 e = ufixed256x80(35.245 % 12.9); //~ ERROR: unresolved symbol `ufixed256x80`
//~^ ERROR: unresolved symbol `ufixed256x80`
        ufixed256x80 f = ufixed256x80(1.2 % 2); //~ ERROR: unresolved symbol `ufixed256x80`
//~^ ERROR: unresolved symbol `ufixed256x80`
        fixed g = 2 ** -2;
        a; b; c; d; e; f; g;
    }
}
