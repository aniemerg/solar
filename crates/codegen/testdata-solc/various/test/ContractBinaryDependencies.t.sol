// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ContractBinaryDependencies.sol";

contract ContractBinaryDependenciesTest {
    ContractBinaryDependencies c;

    function setUp() public {
        c = new ContractBinaryDependencies();
    }

    function test_run() public {
        c.run();
    }
}
