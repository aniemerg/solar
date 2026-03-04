//@ compile-flags: -Ztypeck
contract c {
    function g() public { fun(); } //~ ERROR: unresolved symbol `fun`
}
