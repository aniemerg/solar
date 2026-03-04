// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract NestedDynamicArrayElementCalldataToStorage {
    uint8[][] a;
    uint8[][][] a2;

    function runTest(uint8[][][] calldata _a) public {
        a = _a[1];
        require(a.length == 2);
        require(a[0].length == 1);
        require(a[0][0] == 7);
        require(a[1].length == 2);
        require(a[1][0] == 8);
        require(a[1][1] == 9);
    }

    function run2(uint8[][] calldata _a) public {
        a2 = new uint8[][][](2);
        a2[0] = _a;
        require(a2[0].length == 2);
        require(a2[0][0].length == 1);
        require(a2[0][0][0] == 7);
        require(a2[0][1].length == 2);
        require(a2[0][1][0] == 8);
        require(a2[0][1][1] == 9);
        require(a2[1].length == 0);
    }
}
