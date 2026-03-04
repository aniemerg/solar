// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SendersBalance.sol";

contract SendersBalanceTest {
    SendersBalance c;

    function setUp() public {
        c = new SendersBalance{value: 27}();
    }

    function test_f() public view {
        // c.f() calls c_inner.f() which returns msg.sender.balance == balance of SendersBalance
        assert(c.f() == 27);
    }

    receive() external payable {}
}
