// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/IsoltestFormatting.sol";

contract IsoltestFormattingTest {
    IsoltestFormatting c;

    function setUp() public {
        c = new IsoltestFormatting();
    }

    function test_f() public view {
        uint[5] memory result = c.f();
        assert(result[0] == 4);
        assert(result[1] == 11);
        assert(result[2] == 0x111);
        assert(result[3] == 3355443);
        assert(result[4] == 2222222222222222222);
    }

    function test_g() public view {
        uint[5] memory result = c.g();
        assert(result[0] == 16);
        assert(result[1] == 256);
        assert(result[2] == 257);
        assert(result[3] == 0x333333);
        assert(result[4] == 0x1ed6eb565788e38e);
    }
}
