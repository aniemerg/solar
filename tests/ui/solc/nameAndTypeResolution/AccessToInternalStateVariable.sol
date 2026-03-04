//@ compile-flags: -Ztypeck
contract c {
    uint public a;
}
contract d {
    function g() public { c(address(0)).a(); } //~ ERROR: invalid explicit type conversion
}
