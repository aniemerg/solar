// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract ArrayNestedStorageToMemory {
    uint256[][] a1;
    uint256[][2] a2;
    uint256[2][] a3;
    uint256[2][2] a4;

    constructor() {
        a1 = new uint256[][](2);
        a1[0] = [uint256(1), 2];
        a1[1] = [uint256(3), 4, 5];

        a2[0] = [uint256(6), 7, 8];
        a2[1] = [uint256(9)];

        a3.push([uint256(1), 2]);
        a3.push([uint256(3), 4]);
        a3.push([uint256(5), 6]);

        a4 = [[uint256(10), 11], [uint256(12), 13]];
    }

    function run1() external returns (uint256[][] memory) {
        return a1;
    }

    function run2() external returns (uint256[][2] memory) {
        return a2;
    }

    function run3() external returns (uint256[2][] memory) {
        return a3;
    }

    function run4() external returns (uint256[2][2] memory) {
        return a4;
    }
}
