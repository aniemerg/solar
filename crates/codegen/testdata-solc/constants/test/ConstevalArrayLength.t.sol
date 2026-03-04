// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConstevalArrayLength.sol";

contract ConstevalArrayLengthTest {
    function test_ConstevalArrayLength() public {
        ConstevalArrayLength c = new ConstevalArrayLength();
        (uint len, uint val) = c.f();
        // (12 / 10) * 10 = 1 * 10 = 10 = 0x0a
        assert(len == 0x0a);
        assert(val == 0x0a);
    }
}
