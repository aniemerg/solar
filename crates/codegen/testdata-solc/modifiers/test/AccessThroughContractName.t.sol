// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AccessThroughContractName.sol";

contract AccessThroughContractNameTest {
    AccessThroughContractName c;

    function setUp() public {
        c = new AccessThroughContractName();
    }

    function test_x_initial() public {
        assert(c.x() == 7);
    }

    function test_f_sets_x_to_2() public {
        uint r = c.f();
        assert(r == 9);
        assert(c.x() == 2);
    }

    function test_g_sets_x_to_1() public {
        uint r = c.g();
        assert(r == 10);
        assert(c.x() == 1);
    }

    function test_sequence() public {
        assert(c.x() == 7);
        assert(c.f() == 9);
        assert(c.x() == 2);
        assert(c.g() == 10);
        assert(c.x() == 1);
        assert(c.f() == 9);
        assert(c.x() == 2);
    }
}
