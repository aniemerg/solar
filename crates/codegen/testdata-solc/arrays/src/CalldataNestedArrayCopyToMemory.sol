// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract CalldataNestedArrayCopyToMemory {
    struct shouldBug {
        uint256[][2] deadly;
    }
    function killer(uint256[][2] calldata weapon) pure external returns (shouldBug memory) {
        return shouldBug(weapon);
    }
}
