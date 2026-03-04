// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftLeftLargerType.sol";

contract ShiftLeftLargerTypeTest {
    function test_ShiftLeftLargerType() public {
        C c = new C();
        assert(c.f() == 0);
    }
}
