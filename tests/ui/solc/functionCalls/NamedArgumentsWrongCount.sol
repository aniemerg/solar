//@ compile-flags: -Ztypeck
contract test {
    function a(uint a, uint b) public returns (uint r) {
        r = a + b;
    }
    function b() public returns (uint r) {
        r = a({a: 1}); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 2
    }
}
