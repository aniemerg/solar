// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "../src/TransientStateVariableValueType.sol";

contract TransientStateVariableValueTypeTest {
    TransientStateVariableValueType c;

    function setUp() public {
        c = new TransientStateVariableValueType();
    }

    function test_f() public {
        // x starts at 0 (transient), m(x) captures x=0 as arg, then x += 10 -> x=10, then f body: x *= 10 -> 100
        uint16 r = c.f();
        assert(r == 100);
    }
}
