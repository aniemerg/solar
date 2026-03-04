// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PositiveIntegersToSigned.sol";

contract PositiveIntegersToSignedTest {
    PositiveIntegersToSigned c;

    function setUp() public {
        c = new PositiveIntegersToSigned();
    }

    function test_values() public view {
        assert(c.x() == 2);
        assert(c.y() == 127);
        assert(c.q() == 250);
    }
}
