// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ByteArrayPopLongStorageEmpty {
    uint256 a;
    uint256 b;
    uint256 c;
    bytes data;

    function runTest() public returns (bool) {
        for (uint8 i = 0; i <= 40; i++)
            data.push(bytes1(i+1));
        for (int8 j = 40; j >= 0; j--) {
            require(data[uint8(j)] == bytes1(uint8(j+1)));
            require(data.length == uint8(j+1));
            data.pop();
        }
        return true;
    }
}
