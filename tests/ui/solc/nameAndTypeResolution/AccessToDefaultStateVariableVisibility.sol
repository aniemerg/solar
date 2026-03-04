//@ compile-flags: -Ztypeck
contract c {
    uint a;
}
contract d {
    function g() public { c(address(0)).a(); } //~ ERROR: invalid explicit type conversion
//~^ ERROR: member `a` not found on type `contract c`
}
