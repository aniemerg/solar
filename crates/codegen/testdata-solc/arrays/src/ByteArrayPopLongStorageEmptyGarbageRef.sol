// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ByteArrayPopLongStorageEmptyGarbageRef {
    uint256 a;
    uint256 b;
    bytes data;

    function runTest() public {
        for (uint8 i = 0; i <= 40; i++)
            data.push(0x03);
        for (uint8 j = 0; j <= 40; j++) {
            assembly {
                mstore(0, "garbage")
            }
            data.pop();
        }
    }
}
