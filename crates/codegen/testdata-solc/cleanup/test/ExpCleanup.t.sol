// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExpCleanup.sol";

contract ExpCleanupTest {
    function test_ExpCleanup() public {
        ExpCleanup c = new ExpCleanup();
        // uint8(2)**uint8(8) = 256, which wraps to 0 as uint8
        // 0**0 = 1 (by convention)
        assert(c.f() == 1);
    }
}
