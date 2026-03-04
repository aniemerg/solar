// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PassDynamicArgumentsToTheBaseBaseWithGap.sol";

contract PassDynamicArgumentsToTheBaseBaseWithGapTest {
    Final f;

    function setUp() public {
        f = new Final();
    }

    function test_PassDynamicArgumentsToTheBaseBaseWithGap() public {
        assert(f.m_i() == 4);
    }
}
