// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftNegativeConstantLeft.sol";

contract ShiftNegativeConstantLeftTest {
    function test_ShiftNegativeConstantLeft() public {
        C c = new C();
        assert(c.a() == -16896);
    }
}
