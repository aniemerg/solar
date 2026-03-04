// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/AddmodMulmodZero.sol";

contract AddmodMulmodZeroTest is Test {
    AddmodMulmodZero c;

    function setUp() public {
        c = new AddmodMulmodZero();
    }

    function test_AddmodMulmodZero_f_Zero() public {
        // addmod(1, 2, 0) triggers panic 0x12 (division by zero)
        vm.expectRevert();
        c.f(0);
    }

    function test_AddmodMulmodZero_g_Zero() public {
        // mulmod(1, 2, 0) triggers panic 0x12 (division by zero)
        vm.expectRevert();
        c.g(0);
    }

    function test_AddmodMulmodZero_h() public view {
        assert(c.h() == 2);
    }
}
