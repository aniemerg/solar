// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SuperFunctionDeployed.sol";

contract SuperFunctionDeployedTest {
    SuperFunctionDeployed c;

    function setUp() public {
        c = new SuperFunctionDeployed();
    }

    function test_SuperFunctionDeployed() public view {
        assert(c.test() == true);
    }
}
