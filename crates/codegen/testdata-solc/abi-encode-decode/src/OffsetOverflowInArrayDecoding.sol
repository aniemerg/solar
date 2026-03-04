// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OffsetOverflowInArrayDecoding {
    struct MemoryUint {
        uint field;
    }
    function run() public pure returns (uint) {
        uint[] memory before = new uint[](1); // at offset 0x80
        bytes memory corrupt = abi.encode(uint(32), uint(0));
        MemoryUint memory afterCorrupt;
        afterCorrupt.field = uint(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff80);
        before[0] = 123456;
        uint[][2] memory decoded = abi.decode(corrupt, (uint[][2]));
        return decoded[1][0];
    }
}
