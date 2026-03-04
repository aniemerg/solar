// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayCopyStorageStorageStaticSimple {
    bytes1[2] data1;
    bytes2[2] data2;
    function runTest() public returns (bytes2, bytes2) {
        uint i;
        for (i = 0; i < data1.length; ++i)
            data1[i] = bytes1(uint8(1 + i));
        data2 = data1;
        return (data2[0], data2[1]);
    }
}
