// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArraySliceCalldataToMemory {
    function f(int[] calldata b, uint256 start, uint256 end) public returns (int) {
        int[] memory m = b[start:end];
        uint len = end - start;
        assert(len == m.length);
        for (uint i = 0; i < len; i++) {
            assert(b[start:end][i] == m[i]);
        }
        return [b[start:end]][0][0];
    }

    function g(int[] calldata b, uint256 start, uint256 end) public returns (int[] memory) {
        return b[start:end];
    }

    function h1(int[] memory b) internal returns (int[] memory) {
        return b;
    }

    function h(int[] calldata b, uint256 start, uint256 end) public returns (int[] memory) {
        return h1(b[start:end]);
    }
}
