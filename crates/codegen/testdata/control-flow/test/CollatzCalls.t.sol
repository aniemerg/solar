// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CollatzCalls.sol";

contract CollatzCallsTest {
    CollatzCalls c;

    function setUp() public {
        c = new CollatzCalls();
    }

    function test_CollatzCalls() public view {
        assert(c.run(0) == 0);
        assert(c.run(1) == 1);
        assert(c.run(2) == 1);
        assert(c.run(8) == 1);
        assert(c.run(127) == 1);
    }
}
