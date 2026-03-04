// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ByteArrayPopMaskingLong {
    bytes data;

    function runTest() public returns (bytes memory) {
        for (uint256 i = 0; i < 34; i++) data.push(0x03);
        data.pop();
        return data;
    }
}
