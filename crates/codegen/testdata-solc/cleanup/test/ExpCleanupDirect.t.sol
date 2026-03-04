// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExpCleanupDirect.sol";

contract ExpCleanupDirectTest {
    function test_ExpCleanupDirect() public {
        ExpCleanupDirect c = new ExpCleanupDirect();
        // uint8(2)**uint8(8) = 256 wraps to 0 as uint8
        // uint8(0)**uint8(0) = 1
        assert(c.f() == 1);
    }
}
