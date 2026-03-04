// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../src/TransientFunctionTypeStateVariable.sol";

contract TransientFunctionTypeStateVariableTest {
    function test_TransientFunctionTypeStateVariable() public {
        TransientFunctionTypeStateVariable c = new TransientFunctionTypeStateVariable();
        assert(c.test() == true);
    }
}
