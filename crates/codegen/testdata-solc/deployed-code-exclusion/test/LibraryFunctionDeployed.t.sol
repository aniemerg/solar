// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/LibraryFunctionDeployed.sol";

contract LibraryFunctionDeployedTest {
    LibraryFunctionDeployed c;

    function setUp() public {
        c = new LibraryFunctionDeployed();
    }

    function test_LibraryFunctionDeployed() public view {
        assert(c.test() == true);
    }
}
