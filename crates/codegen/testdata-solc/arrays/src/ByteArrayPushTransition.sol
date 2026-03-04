// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Tests transition between short and long encoding
contract ByteArrayPushTransition {
    bytes data;

    function runTest() public returns (uint256) {
        for (uint8 i = 1; i < 40; i++) {
            data.push(bytes1(i));
            if (data.length != i) return 0x1000 + i;
            if (data[data.length - 1] != bytes1(i)) return i;
        }
        for (uint8 i = 1; i < 40; i++)
            if (data[i - 1] != bytes1(i)) return 0x1000000 + i;
        return 0;
    }
}
