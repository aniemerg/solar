// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OffsetOverflowInArrayDecoding2 {
    struct MemoryTuple {
        uint field1;
        uint field2;
    }
    function withinArray() public pure returns (uint) {
        uint[] memory before = new uint[](1);
        bytes memory corrupt = abi.encode(uint(32), uint(2));
        MemoryTuple memory afterCorrupt;
        before[0] = 123456;
        afterCorrupt.field1 = uint(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff60);
        afterCorrupt.field2 = uint(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff60);
        uint[][] memory decoded = abi.decode(corrupt, (uint[][]));
        return decoded[0][0] + decoded[1][0];
    }
}
