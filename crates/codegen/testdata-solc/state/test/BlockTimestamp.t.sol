// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BlockTimestamp.sol";

contract BlockTimestampTest {
    function test_BlockTimestamp() public {
        BlockTimestamp c = new BlockTimestamp();
        assert(c.f() == block.timestamp);
        assert(c.f() > 0);
    }
}
