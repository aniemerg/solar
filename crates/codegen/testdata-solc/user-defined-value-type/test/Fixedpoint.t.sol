// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Fixedpoint.sol";
import {Test} from "forge-std/Test.sol";

contract FixedpointTest is Test {
    Fixedpoint c;

    function setUp() public {
        c = new Fixedpoint();
    }

    function test_add_zero() public {
        assert(UFixed256x18.unwrap(c.add(UFixed256x18.wrap(0), UFixed256x18.wrap(0))) == 0);
    }

    function test_add_simple() public {
        assert(UFixed256x18.unwrap(c.add(UFixed256x18.wrap(25), UFixed256x18.wrap(45))) == 70);
    }

    function test_add_overflow() public {
        vm.expectRevert();
        c.add(UFixed256x18.wrap(type(uint256).max), UFixed256x18.wrap(10));
    }

    function test_mul_normal() public {
        assert(UFixed256x18.unwrap(c.mul(UFixed256x18.wrap(340282366920938463463374607431768211456), 20)) == 6805647338418769269267492148635364229120);
    }

    function test_floor() public {
        assert(c.floor(UFixed256x18.wrap(11579208923731619542357098500868790785326998665640564039457584007913129639930)) == 11579208923731619542357098500868790785326998665640564039457);
    }

    function test_toUFixed256x18_zero() public {
        assert(UFixed256x18.unwrap(c.toUFixed256x18(0)) == 0);
    }

    function test_toUFixed256x18_five() public {
        assert(UFixed256x18.unwrap(c.toUFixed256x18(5)) == 5000000000000000000);
    }

    function test_toUFixed256x18_overflow() public {
        vm.expectRevert();
        c.toUFixed256x18(115792089237316195423570985008687907853269984665640564039458);
    }
}
