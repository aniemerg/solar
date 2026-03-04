//@ compile-flags: -Ztypeck
contract c {
    function f () public
    {
        a = abd; //~ ERROR: unresolved symbol `abd`
        a = ade; //~ ERROR: unresolved symbol `ade`
    }
    uint256 a;
    uint256 abc;
}
