// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SendZeroEther.sol";

contract SendZeroEtherTest {
    SendZeroEther c;

    function setUp() public {
        c = new SendZeroEther{value: 20 wei}();
    }

    function test_s_returns_true() public {
        assert(c.s() == true);
    }
}
