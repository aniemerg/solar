//@ compile-flags: -Ztypeck
contract base {
    function f() private {}
}
contract derived is base {
    function g() public { base.f(); } //~ ERROR: member `f` not found on type `type(contract base)`
}
