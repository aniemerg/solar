// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/NewOperator.sol";

contract NewOperatorTest {
    function test_NewOperator() public {
        NewOperator c = new NewOperator();
        assert(c.f() == 2);
    }
}
