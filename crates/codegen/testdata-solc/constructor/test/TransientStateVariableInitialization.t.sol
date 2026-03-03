// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "../src/TransientStateVariableInitialization.sol";

contract TransientStateVariableInitializationTest {
    function test_TransientStateVariableInitialization() public {
        TransientStateVariableInitialization c = new TransientStateVariableInitialization();
        assert(c.f() == 100);
    }
}
