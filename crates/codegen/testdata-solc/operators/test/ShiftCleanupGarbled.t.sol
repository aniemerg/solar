// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftCleanupGarbled.sol";

contract ShiftCleanupGarbledTest {
    function test_ShiftCleanupGarbled() public {
        C c = new C();
        assert(c.f() == 0x0);
    }
}
