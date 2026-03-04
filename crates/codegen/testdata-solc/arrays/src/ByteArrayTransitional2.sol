// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Tests transition between short and long encoding both ways
contract ByteArrayTransitional2 {
    bytes data;

    function runTest() public returns (uint256) {
        for (uint8 i = 0; i < 33; i++) {
            data.push(bytes1(i));
        }
        for (uint8 i = 0; i < data.length; i++)
            if (data[i] != bytes1(i)) return i;
        data.pop();
        data.pop();
        for (uint8 i = 0; i < data.length; i++)
            if (data[i] != bytes1(i)) return i;
        return 0;
    }
}
