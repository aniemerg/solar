// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExpCleanupNonzeroBase.sol";

contract ExpCleanupNonzeroBaseTest {
    function test_ExpCleanupNonzeroBase() public {
        ExpCleanupNonzeroBase c = new ExpCleanupNonzeroBase();
        // uint16(0x166)=358, uint8(358)=0x66=102
        // uint8(2)**uint8(8) = 0 (wraps)
        // 102**0 = 1
        assert(c.f() == 1);
    }
}
