// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftNegativeConstantRight.sol";

contract ShiftNegativeConstantRightTest {
    function test_ShiftNegativeConstantRight() public {
        C c = new C();
        assert(c.a() == -66);
    }
}
