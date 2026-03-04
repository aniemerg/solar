// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StaticMemoryArrayAllocation {
    function memorySize() internal pure returns (uint s) {
        assembly {
            s := mload(0x40)
        }
    }

    function withValue() public pure returns (uint) {
        uint[20] memory x;
        uint memorySizeBefore = memorySize();
        uint[20] memory t = x;
        uint memorySizeAfter = memorySize();
        return memorySizeAfter - memorySizeBefore;
    }

    function withoutValue() public pure returns (uint) {
        uint[20] memory x;
        uint memorySizeBefore = memorySize();
        uint[20] memory t;
        uint memorySizeAfter = memorySize();
        return memorySizeAfter - memorySizeBefore;
    }
}
