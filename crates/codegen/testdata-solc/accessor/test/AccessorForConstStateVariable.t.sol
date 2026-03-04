// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AccessorForConstStateVariable.sol";

contract AccessorForConstStateVariableTest {
    function test_ticketPrice() public {
        AccessorForConstStateVariable c = new AccessorForConstStateVariable();
        assert(c.ticketPrice() == 555);
    }
}
