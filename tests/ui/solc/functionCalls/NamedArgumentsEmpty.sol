//@ compile-flags: -Ztypeck
contract test {
    function a(uint a, uint b) public returns (uint r) {
        r = a + b;
    }
    function b() public returns (uint r) {
        r = a({}); //~ ERROR: wrong argument count for function call: 0 arguments given but expected 2
    }
}
