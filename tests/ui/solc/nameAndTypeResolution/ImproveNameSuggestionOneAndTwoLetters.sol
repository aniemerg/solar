//@ compile-flags: -Ztypeck
contract c {
    function f () public
    {
        a = ac; //~ ERROR: unresolved symbol `ac`
        a = cd; //~ ERROR: unresolved symbol `cd`
        a = b; //~ ERROR: unresolved symbol `b`
    }
    uint256 a;
    uint256 ab;
}
