// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MemoryStructsAsFunctionArgs.sol";

contract MemoryStructsAsFunctionArgsTest {
    MemoryStructsAsFunctionArgs c;

    function setUp() public {
        c = new MemoryStructsAsFunctionArgs();
    }

    function test_MemoryStructsAsFunctionArgs() public view {
        (uint256 x, uint256 y, uint256 z) = c.test();
        assert(x == 1 && y == 2 && z == 3);
    }
}
