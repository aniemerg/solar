//@ compile-flags: -Ztypeck
contract c {
    function func() public {}
    function g() public { fun(); } //~ ERROR: unresolved symbol `fun`
}
