//@ compile-flags: -Ztypeck
contract A {
    function f(uint[] calldata) external pure {} //~ ERROR: function with same name and parameter types declared twice
    function f(uint[] memory) internal pure {}
}
