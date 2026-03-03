// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StateVariableInitialization.sol";

contract StateVariableInitializationTest {
    StateVariableInitialization c;

    function setUp() public {
        c = new StateVariableInitialization();
    }

    function test_StateVariableInitialization() public view {
        assert(c.i() == 2);
        assert(c.k() == 0);
    }
}
