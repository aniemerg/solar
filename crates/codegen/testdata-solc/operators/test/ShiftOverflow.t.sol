// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ShiftOverflow.sol";

contract ShiftOverflowTest {
    function test_ShiftOverflow() public {
        C c = new C();
        assert(c.leftU(255, 8) == 0);
        assert(c.leftU(255, 1) == 254);
        assert(c.leftU(255, 0) == 255);
        // 1 << 7 = 128 which is -128 as int8
        assert(c.leftS(1, 7) == -128);
        assert(c.leftS(1, 6) == 64);
    }
}
