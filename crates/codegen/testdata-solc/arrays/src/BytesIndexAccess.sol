// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesIndexAccess {
    bytes data;

    function direct(bytes calldata arg, uint256 index) external pure returns (uint256) {
        return uint256(uint8(arg[index]));
    }

    function storageCopyRead(bytes calldata arg, uint256 index) external returns (uint256) {
        data = arg;
        return uint256(uint8(data[index]));
    }

    function storageWrite() external returns (uint256) {
        data = new bytes(35);
        data[31] = 0x77;
        data[32] = 0x14;

        data[31] = 0x01;
        data[31] |= 0x08;
        data[30] = 0x01;
        data[32] = 0x03;
        return uint256(uint8(data[30])) * 0x100
            | uint256(uint8(data[31])) * 0x10
            | uint256(uint8(data[32]));
    }
}
