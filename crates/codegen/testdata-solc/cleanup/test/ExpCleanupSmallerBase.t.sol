// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExpCleanupSmallerBase.sol";

contract ExpCleanupSmallerBaseTest {
    function test_ExpCleanupSmallerBase() public {
        ExpCleanupSmallerBase c = new ExpCleanupSmallerBase();
        // 2**256 mod 2**16 = 0 (2**256 is 0 in uint16 since 256 > 16)
        assert(c.f() == 0);
    }
}
