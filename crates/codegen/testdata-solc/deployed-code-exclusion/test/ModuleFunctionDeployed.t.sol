// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ModuleFunctionDeployed.sol";

contract ModuleFunctionDeployedTest {
    ModuleFunctionDeployed c;

    function setUp() public {
        c = new ModuleFunctionDeployed();
    }

    function test_ModuleFunctionDeployed() public view {
        assert(c.test() == true);
    }
}
