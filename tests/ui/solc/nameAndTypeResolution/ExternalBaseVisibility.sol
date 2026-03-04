//@ compile-flags: -Ztypeck
contract base {
    function f() external {}
}
contract derived is base {
    function g() public { base.f(); } //~ ERROR: member `f` not found on type `type(contract base)`
}
