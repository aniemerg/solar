//@ compile-flags: -Ztypeck
contract c {
    function f () public
    {
        a = land; //~ ERROR: unresolved symbol `a`
//~^ ERROR: unresolved symbol `land`
        a = lost; //~ ERROR: unresolved symbol `a`
//~^ ERROR: unresolved symbol `lost`
        a = lang; //~ ERROR: unresolved symbol `a`
//~^ ERROR: unresolved symbol `lang`
    }
    uint256 long;
    uint256 abc;
}
