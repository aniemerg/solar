// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CalldataArrayThreeDimensional.sol";

contract CalldataArrayThreeDimensionalTest is Test {
    CalldataArrayThreeDimensional c;

    function setUp() public {
        c = new CalldataArrayThreeDimensional();
    }

    function _makeX() internal pure returns (uint256[][2][] memory) {
        uint256[][2][] memory x = new uint256[][2][](1);
        x[0][0] = new uint256[](1);
        x[0][1] = new uint256[](1);
        x[0][0][0] = 42;
        x[0][1][0] = 23;
        return x;
    }

    function test_f_basic() public view {
        uint256[][2][] memory x = _makeX();
        (uint256 a, uint256 b, uint256 c2, uint256 d) = c.f(x, 0, 0, 0);
        assert(a == 1);
        assert(b == 2);
        assert(c2 == 1);
        assert(d == 42);
    }

    function test_f_second_sub() public view {
        uint256[][2][] memory x = _makeX();
        (uint256 a, uint256 b, uint256 c2, uint256 d) = c.f(x, 0, 1, 0);
        assert(a == 1);
        assert(b == 2);
        assert(c2 == 1);
        assert(d == 23);
    }

    function test_f_two_element_sub() public view {
        uint256[][2][] memory x = new uint256[][2][](1);
        x[0][0] = new uint256[](1);
        x[0][1] = new uint256[](2);
        x[0][0][0] = 42;
        x[0][1][0] = 23;
        x[0][1][1] = 17;
        (uint256 a, uint256 b, uint256 c2, uint256 d) = c.f(x, 0, 1, 0);
        assert(a == 1);
        assert(b == 2);
        assert(c2 == 2);
        assert(d == 23);
    }

    function test_f_oob_outer() public {
        uint256[][2][] memory x = _makeX();
        vm.expectRevert();
        c.f(x, 1, 0, 0);
    }

    function test_f_oob_inner() public {
        uint256[][2][] memory x = _makeX();
        vm.expectRevert();
        c.f(x, 0, 2, 0);
    }
}
