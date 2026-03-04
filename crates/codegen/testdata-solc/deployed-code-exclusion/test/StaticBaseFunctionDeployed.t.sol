// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StaticBaseFunctionDeployed.sol";

contract StaticBaseFunctionDeployedTest {
    StaticBaseFunctionDeployed c;

    function setUp() public {
        c = new StaticBaseFunctionDeployed();
    }

    function test_StaticBaseFunctionDeployed() public view {
        assert(c.test() == true);
    }
}
