// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayMultipleLocalVars.sol";

contract ArrayMultipleLocalVarsTest {
    ArrayMultipleLocalVars c;

    function setUp() public {
        c = new ArrayMultipleLocalVars();
    }

    function test_f_skip1000_sum3() public view {
        uint256[] memory seq = new uint256[](3);
        seq[0] = 1000;
        seq[1] = 1;
        seq[2] = 2;
        assert(c.f(seq) == 3);
    }

    function test_f_stop_at_500() public view {
        uint256[] memory seq = new uint256[](3);
        seq[0] = 100;
        seq[1] = 500;
        seq[2] = 300;
        assert(c.f(seq) == 600);
    }

    function test_f_break_at_10() public view {
        uint256[] memory seq = new uint256[](11);
        seq[0] = 1;
        seq[1] = 2;
        seq[2] = 3;
        seq[3] = 4;
        seq[4] = 5;
        seq[5] = 6;
        seq[6] = 7;
        seq[7] = 8;
        seq[8] = 9;
        seq[9] = 10;
        seq[10] = 111;
        assert(c.f(seq) == 55);
    }
}
