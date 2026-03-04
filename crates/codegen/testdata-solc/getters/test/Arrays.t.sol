// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/Arrays.sol";

contract ArraysTest is Test {
    Arrays c;

    function setUp() public {
        c = new Arrays();
    }

    function test_valid_access() public view {
        // a(1,0) -> 3, a(1,1) -> 4
        assert(c.a(1, 0) == 3);
        assert(c.a(1, 1) == 4);
    }

    function test_out_of_bounds_0_0() public {
        vm.expectRevert();
        c.a(0, 0);
    }

    function test_out_of_bounds_2_0() public {
        vm.expectRevert();
        c.a(2, 0);
    }
}
