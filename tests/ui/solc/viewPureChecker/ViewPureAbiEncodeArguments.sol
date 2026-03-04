//@ compile-flags: -Ztypeck
contract C {
    uint x;
    function gView() public view returns (uint) { return x; }
    function gNonPayable() public returns (uint) { x = 4; return 0; }

    function f1() view public returns (bytes memory) {
        return abi.encode(gView()); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
    }
    function f2() view public returns (bytes memory) {
        return abi.encodePacked(gView()); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
    }
    function f3() view public returns (bytes memory) {
        return abi.encodeWithSelector(0x12345678, gView()); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
    function f4() view public returns (bytes memory) {
        return abi.encodeWithSignature("f(uint256)", gView()); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
    function g1() public returns (bytes memory) {
        return abi.encode(gNonPayable()); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
    }
    function g2() public returns (bytes memory) {
        return abi.encodePacked(gNonPayable()); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
    }
    function g3() public returns (bytes memory) {
        return abi.encodeWithSelector(0x12345678, gNonPayable()); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
    function g4() public returns (bytes memory) {
        return abi.encodeWithSignature("f(uint256)", gNonPayable()); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
    // This will generate the only warning.
    function check() public returns (bytes memory) {
        return abi.encode(2); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
    }
}
