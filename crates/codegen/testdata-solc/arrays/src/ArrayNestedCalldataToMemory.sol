// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract ArrayNestedCalldataToMemory {
    function run1(uint256[][] calldata c) external returns (uint256, uint256) {
        uint256[][] memory a1 = c;
        assert(a1[0][0] == c[0][0]);
        assert(a1[0][1] == c[0][1]);
        return (a1.length, a1[0][0] + a1[1][1]);
    }

    function run2(uint256[][2] calldata c) external returns (uint256, uint256) {
        uint256[][2] memory a2 = c;
        assert(a2[0][0] == c[0][0]);
        assert(a2[0][1] == c[0][1]);
        return (a2[0].length, a2[0][0] + a2[1][1]);
    }

    function run3(uint256[2][] calldata c) external returns (uint256, uint256) {
        uint256[2][] memory a3 = c;
        assert(a3[0][0] == c[0][0]);
        assert(a3[0][1] == c[0][1]);
        return (a3.length, a3[0][0] + a3[1][1]);
    }

    function run4(uint256[2][2] calldata c) external returns (uint256) {
        uint256[2][2] memory a4 = c;
        assert(a4[0][0] == c[0][0]);
        assert(a4[0][1] == c[0][1]);
        return (a4[0][0] + a4[1][1]);
    }
}
