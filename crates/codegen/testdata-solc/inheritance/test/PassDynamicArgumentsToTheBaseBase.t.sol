// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PassDynamicArgumentsToTheBaseBase.sol";

contract PassDynamicArgumentsToTheBaseBaseTest {
    Final f;

    function setUp() public {
        f = new Final();
    }

    function test_PassDynamicArgumentsToTheBaseBase() public {
        assert(f.m_i() == 4);
    }
}
