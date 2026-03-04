// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SimpleConstantVariablesTest.sol";

contract SimpleConstantVariablesTestTest {
    function test_SimpleConstantVariablesTest() public {
        SimpleConstantVariablesTest c = new SimpleConstantVariablesTest();
        assert(c.getX() == 56);
    }
}
