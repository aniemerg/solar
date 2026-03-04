//@ compile-flags: -Ztypeck
contract C {
    function test(uint a) public returns (uint b) { } //~ ERROR: function with same name and parameter types declared twice
    function test(uint a) external {}
}
