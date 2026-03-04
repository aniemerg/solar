// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructAllocation {
    struct S {
        uint x;
        uint y;
        uint z;
    }

    function memorySize() internal pure returns (uint s) {
        assembly {
            s := mload(0x40)
        }
    }

    function withValue() public pure returns (uint) {
        S memory x = S(1, 2, 3);
        uint memorySizeBefore = memorySize();
        S memory t = x;
        uint memorySizeAfter = memorySize();
        return memorySizeAfter - memorySizeBefore;
    }

    function withoutValue() public pure returns (uint) {
        uint memorySizeBefore = memorySize();
        S memory t;
        uint memorySizeAfter = memorySize();
        return memorySizeAfter - memorySizeBefore;
    }
}
