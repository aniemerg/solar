// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InheritanceBaseBaseOverload.sol";

contract InheritanceBaseBaseOverloadTest {
    InheritanceBaseBaseOverload c;

    function setUp() public {
        c = new InheritanceBaseBaseOverload();
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

    function test_bInit_single() public {
        // BaseBase.init(4): x = 4 + 1 = 5
        c.bInit(4);
        assert(c.x() == 5);
    }

    function test_bInit_double() public {
        // BaseBase.init(9, 10): x = 10, y = 9
        c.bInit(9, 10);
        assert(c.x() == 10);
        assert(c.y() == 9);
    }
}
