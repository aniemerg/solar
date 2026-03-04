// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/VirtualFunctionDeployed.sol";

contract VirtualFunctionDeployedTest {
    VirtualFunctionDeployed c;

    function setUp() public {
        c = new VirtualFunctionDeployed();
    }

    function test_VirtualFunctionDeployed() public view {
        assert(c.test() == true);
    }
}
