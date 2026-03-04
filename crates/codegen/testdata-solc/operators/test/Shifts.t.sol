// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Shifts.sol";

contract ShiftsTest {
    function test_Shifts() public {
        C c = new C();
        assert(c.f(7) == 28);
    }
}
