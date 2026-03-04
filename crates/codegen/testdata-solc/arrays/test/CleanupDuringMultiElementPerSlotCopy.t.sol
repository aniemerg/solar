// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CleanupDuringMultiElementPerSlotCopy.sol";

contract CleanupDuringMultiElementPerSlotCopyTest {
    function test_CleanupDuringMultiElementPerSlotCopy() public {
        CleanupDuringMultiElementPerSlotCopy c = new CleanupDuringMultiElementPerSlotCopy();
        // f() -> 0
        assert(c.f() == 0);
    }
}
