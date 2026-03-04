// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MemoryStructsNested.sol";

contract MemoryStructsNestedTest {
    MemoryStructsNested c;

    function setUp() public {
        c = new MemoryStructsNested();
    }

    function test_MemoryStructsNested() public view {
        (uint256 a, uint256 x, uint256 y, uint256 z) = c.test();
        assert(a == 1 && x == 2 && y == 3 && z == 4);
    }
}
