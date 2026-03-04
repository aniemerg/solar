// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AccessorForStateVariable.sol";

contract AccessorForStateVariableTest {
    function test_ticketPrice() public {
        AccessorForStateVariable c = new AccessorForStateVariable();
        assert(c.ticketPrice() == 500);
    }
}
