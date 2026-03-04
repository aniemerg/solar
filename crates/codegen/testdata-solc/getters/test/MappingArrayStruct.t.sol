// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/MappingArrayStruct.sol";

contract MappingArrayStructTest is Test {
    MappingArrayStruct c;

    function setUp() public {
        c = new MappingArrayStruct();
    }

    function test_m_valid() public view {
        (uint a, uint b) = c.m(1, 0);
        assert(a == 1 && b == 2);

        (a, b) = c.m(1, 1);
        assert(a == 3 && b == 4);
    }

    function test_m_out_of_bounds() public {
        // m(uint256,uint256): 0, 0 -> FAILURE (dynamic array of length 0)
        vm.expectRevert();
        c.m(0, 0);
    }

    function test_m_out_of_bounds_1_2() public {
        // m(uint256,uint256): 1, 2 -> FAILURE
        vm.expectRevert();
        c.m(1, 2);
    }

    function test_n_getters() public view {
        // n uses fixed size [3], so out-of-range keys return zero-default
        (uint a, uint b) = c.n(0, 0);
        assert(a == 0 && b == 0);

        (a, b) = c.n(1, 0);
        assert(a == 7 && b == 8);

        (a, b) = c.n(1, 1);
        assert(a == 9 && b == 10);

        (a, b) = c.n(1, 2);
        assert(a == 0 && b == 0);
    }
}
