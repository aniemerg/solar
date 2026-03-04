// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataNestedArrayReencode {
    function f(uint[][] calldata a) public returns (bytes memory) {
        return abi.encode(a);
    }
    function g(uint8[][][] calldata a) public returns (bytes memory) {
        return abi.encode(a);
    }
    function h(uint16[][2][] calldata a) public returns (bytes memory) {
        return abi.encode(a);
    }
    function i(uint16[][][1] calldata a) public returns (bytes memory) {
        return abi.encode(a);
    }
    function j(uint16[2][][] calldata a) public returns (bytes memory) {
        return abi.encode(a);
    }
}
