// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EventReallyLotsOfData.sol";

contract EventReallyLotsOfDataTest {
    EventReallyLotsOfData c;

    function setUp() public {
        c = new EventReallyLotsOfData();
    }

    function test_deposit() public {
        // Emits Deposit(uint256,bytes,uint256) with msg.data; verify call succeeds
        c.deposit();
    }
}
