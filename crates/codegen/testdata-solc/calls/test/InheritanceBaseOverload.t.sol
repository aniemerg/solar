// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InheritanceBaseOverload.sol";

contract InheritanceBaseOverloadTest {
    InheritanceBaseOverload c;

    function setUp() public {
        c = new InheritanceBaseOverload();
    }

    function test_initial_values() public view {
        assert(c.x() == 0);
        assert(c.y() == 0);
    }

    function test_cInit_single() public {
        c.cInit(2);
        assert(c.x() == 2);
        assert(c.y() == 0);
    }

    function test_cInit_double() public {
        c.cInit(3, 3);
        assert(c.x() == 3);
        assert(c.y() == 3);
    }
}
