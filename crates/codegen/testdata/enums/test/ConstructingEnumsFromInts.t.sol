// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ConstructingEnumsFromInts.sol";

contract ConstructingEnumsFromIntsTest {
    ConstructingEnumsFromInts c;

    function setUp() public {
        c = new ConstructingEnumsFromInts();
    }

    function test_ConstructingEnumsFromInts() public view {
        assert(c.test() == 1);
    }
}
