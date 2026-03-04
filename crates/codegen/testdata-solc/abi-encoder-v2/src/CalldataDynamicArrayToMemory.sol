// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataDynamicArrayToMemory {
    function f(uint[][] calldata a) public returns (uint[][] memory) {
        return a;
    }

    function g(uint[][][] calldata a) public returns (uint[][][] memory) {
        return a;
    }

    function h(uint[2][][] calldata a) public returns (uint[2][][] memory) {
        return a;
    }
}
