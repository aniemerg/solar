//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        ufixed256x80 a = ufixed256x80(1/3); a; //~ ERROR: unresolved symbol `ufixed256x80`
//~^ ERROR: unresolved symbol `ufixed256x80`
        ufixed248x80 b = ufixed248x80(1/3); b; //~ ERROR: unresolved symbol `ufixed248x80`
//~^ ERROR: unresolved symbol `ufixed248x80`
        ufixed8x1 c = ufixed8x1(1/3); c; //~ ERROR: unresolved symbol `ufixed8x1`
//~^ ERROR: unresolved symbol `ufixed8x1`
    }
}
