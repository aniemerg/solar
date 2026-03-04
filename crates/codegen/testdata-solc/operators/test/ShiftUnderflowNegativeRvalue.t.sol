// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftUnderflowNegativeRvalue.sol";

contract ShiftUnderflowNegativeRvalueTest {
    function test_ShiftUnderflowNegativeRvalue() public {
        C c = new C();
        // -1 as uint256 is a huge number (2^256 - 1), shift by that is always 0
        assert(c.f(1, uint256(int256(-1))) == 0);
        assert(c.g(1, uint256(int256(-1))) == 0);
    }
}
