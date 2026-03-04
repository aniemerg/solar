// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StateVariableLocalVariableMixture.sol";

contract StateVariableLocalVariableMixtureTest {
    StateVariableLocalVariableMixture c;

    function setUp() public {
        c = new StateVariableLocalVariableMixture();
    }

    function test_a() public {
        assert(c.a() == 2);
    }
}
