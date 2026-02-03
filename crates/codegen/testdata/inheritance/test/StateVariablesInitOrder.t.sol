// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StateVariablesInitOrder.sol";

contract StateVariablesInitOrderTest {
    StateVariablesInitOrderB b;

    function setUp() public {
        b = new StateVariablesInitOrderB();
    }

    function test_StateVariablesInitOrder() public view {
        assert(b.x() == 1);
    }
}
