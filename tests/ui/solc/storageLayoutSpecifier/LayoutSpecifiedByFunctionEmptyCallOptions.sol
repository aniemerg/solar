contract A {
    function f() external pure returns (uint) {}
}
contract C is A layout at this.f{}() {} //~ ERROR: expected global item (pragma, import directive, contract, interface, library, struct, enum, constant, function, modifier, or error definition), found `(`
