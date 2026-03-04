//@ compile-flags: -Ztypeck
contract C {
    function g() pure internal {
    }
    function f() public view returns (bytes4) {
        return g.selector; //~ ERROR: member `selector` not found on type `function () pure`
    }
}
