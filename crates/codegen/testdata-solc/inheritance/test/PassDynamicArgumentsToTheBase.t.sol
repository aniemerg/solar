// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PassDynamicArgumentsToTheBase.sol";

contract PassDynamicArgumentsToTheBaseTest {
    Final f;

    function setUp() public {
        f = new Final();
    }

    function test_PassDynamicArgumentsToTheBase() public {
        assert(f.m_i() == 4);
    }
}
