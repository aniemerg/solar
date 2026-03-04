// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BlockNumber.sol";

contract BlockNumberTest {
    function test_BlockNumber() public {
        BlockNumber c = new BlockNumber();
        assert(c.f() == block.number);
        assert(c.f() > 0);
    }
}
