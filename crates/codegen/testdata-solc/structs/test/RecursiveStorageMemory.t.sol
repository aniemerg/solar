// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/RecursiveStorageMemory.sol";

contract RecursiveStorageMemoryTest {
    RecursiveStorageMemory c;

    function setUp() public {
        c = new RecursiveStorageMemory();
    }

    function test_RecursiveStorageMemory() public {
        (uint256 a, uint256 b, uint256 cc) = c.run();
        assert(a == 2 && b == 23 && cc == 42);
    }
}
