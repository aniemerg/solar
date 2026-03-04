// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StateVariableUnderContractName.sol";

contract StateVariableUnderContractNameTest {
    StateVariableUnderContractName c;

    function setUp() public {
        c = new StateVariableUnderContractName();
    }

    function test_getStateVar() public view {
        assert(c.getStateVar() == 42);
    }
}
