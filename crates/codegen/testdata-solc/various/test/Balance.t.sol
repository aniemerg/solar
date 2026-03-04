// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Balance.sol";

contract BalanceTest {
    Balance c;

    function setUp() public {
        c = new Balance{value: 23}();
    }

    function test_getBalance() public {
        assert(c.getBalance() == 23);
    }

    receive() external payable {}
}
