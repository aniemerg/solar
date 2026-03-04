// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayCopyStorageStorageStaticDynamic {
    uint256[9] data1;
    uint256[] data2;

    function runTest() public returns (uint256 x, uint256 y) {
        data1[8] = 4;
        data2 = data1;
        x = data2.length;
        y = data2[8];
    }
}
