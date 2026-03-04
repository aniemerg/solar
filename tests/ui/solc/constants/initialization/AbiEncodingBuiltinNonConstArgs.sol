//@ compile-flags: -Ztypeck
contract C {
    uint k = 1;

    bytes32 constant a = keccak256(abi.encode(1, k)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    bytes32 constant b = keccak256(abi.encodePacked(uint(1), k)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    bytes32 constant c = keccak256(abi.encodeWithSelector(0x12345678, k, 2)); //~ ERROR: wrong argument count for function call: 3 arguments given but expected 0
    bytes32 constant d = keccak256(abi.encodeWithSignature("f()", 1, k)); //~ ERROR: wrong argument count for function call: 3 arguments given but expected 0
}
