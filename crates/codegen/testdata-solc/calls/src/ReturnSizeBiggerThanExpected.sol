// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ShortReturn {
    function f() external pure returns (bytes32);
}

contract LongReturn {
    function f() external pure returns (uint[20] memory) {}
}

contract ReturnSizeBiggerThanExpected {
    function run() public returns (uint) {
        LongReturn longReturn = new LongReturn();
        uint freeMemoryBefore;
        assembly {
            freeMemoryBefore := mload(0x40)
        }

        ShortReturn(address(longReturn)).f();

        uint freeMemoryAfter;
        assembly {
            freeMemoryAfter := mload(0x40)
        }

        return freeMemoryAfter - freeMemoryBefore;
    }
}
