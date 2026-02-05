// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConditionalWithArguments.sol";

contract ConditionalWithArgumentsTest {
    ConditionalWithArguments c;

    function setUp() public {
        c = new ConditionalWithArguments();
    }

    function test_ConditionalWithArguments() public view {
        assert(c.f() == 1);
    }
}
