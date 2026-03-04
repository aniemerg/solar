//@ compile-flags: -Ztypeck
contract c {
    function f() internal {}
}
contract d {
    function g() public { c(address(0)).f(); } //~ ERROR: invalid explicit type conversion
//~^ ERROR: member `f` not found on type `contract c`
}
