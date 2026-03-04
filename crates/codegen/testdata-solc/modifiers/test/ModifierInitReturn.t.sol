// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ModifierInitReturn.sol";

contract ModifierInitReturnTest {
    ModifierInitReturn c;

    function setUp() public {
        c = new ModifierInitReturn();
    }

    function test_f_below_threshold() public {
        uint[5] memory r = c.f(9);
        assert(r[0] == 0);
        assert(r[1] == 0);
        assert(r[2] == 0);
        assert(r[3] == 0);
        assert(r[4] == 0);
    }

    function test_f_at_threshold() public {
        uint[5] memory r = c.f(10);
        assert(r[0] == 0);
        assert(r[1] == 0);
        assert(r[2] == 3);
        assert(r[3] == 0);
        assert(r[4] == 0);
    }
}
