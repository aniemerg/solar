// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayCopyStorageStorageDifferentBase {
    uint64[] data1;
    uint256[] data2;

    function runTest() public returns (uint256 x, uint256 y) {
        data2.push(11);
        data1.push(0);
        data1.push(1);
        data1.push(2);
        data1.push(3);
        data1.push(4);
        data2 = data1;
        assert(data1[0] == data2[0]);
        x = data2.length;
        y = data2[4];
    }
}
