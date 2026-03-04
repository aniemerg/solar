// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftCleanup.sol";

contract ShiftCleanupTest {
    function test_ShiftCleanup() public {
        C c = new C();
        assert(c.f() == 0x0);
    }
}
