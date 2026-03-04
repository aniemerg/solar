// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConstantVariables.sol";

contract ConstantVariablesTest {
    function test_ConstantVariables() public {
        // The original test only checks constructor() -> (no revert)
        ConstantVariables c = new ConstantVariables();
        // successful construction is the entire assertion
        assert(address(c) != address(0));
    }
}
