// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NestedArrayElementMemoryToStorage {
    uint8[2][2] a1;
    uint8[2][2][2] a2;

    function runTest(uint8[2][2][2] memory _a) public {
        a1 = _a[0];
        require(a1[0][0] == 1);
        require(a1[0][1] == 2);
        require(a1[1][0] == 3);
        require(a1[1][1] == 4);
    }

    function runTest2(uint8[2][2] memory _a) public {
        a2[0] = _a;
        require(a2[0][0][0] == 1);
        require(a2[0][0][1] == 2);
        require(a2[0][1][0] == 3);
        require(a2[0][1][1] == 4);
        require(a2[1][0][0] == 0);
        require(a2[1][0][1] == 0);
        require(a2[1][1][0] == 0);
        require(a2[1][1][1] == 0);
    }
}
