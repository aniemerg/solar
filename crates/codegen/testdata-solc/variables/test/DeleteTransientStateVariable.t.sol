// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../src/DeleteTransientStateVariable.sol";

contract DeleteTransientStateVariableTest {
    function test_DeleteTransientStateVariable() public {
        DeleteTransientStateVariable c = new DeleteTransientStateVariable();
        assert(c.f() == 0);
    }
}
