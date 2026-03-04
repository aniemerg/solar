//@ compile-flags: -Ztypeck
contract C {
    function f() pure public returns (bytes memory r) {
        r = abi.encode(1, 2); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        r = abi.encodePacked(f()); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
        r = abi.encodeWithSelector(0x12345678, 1); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        r = abi.encodeWithSignature("f(uint256)", 4); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
