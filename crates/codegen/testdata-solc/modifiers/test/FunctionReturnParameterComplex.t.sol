// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/FunctionReturnParameterComplex.sol";

contract FunctionReturnParameterComplexTest is Test {
    FunctionReturnParameterComplex c;

    function setUp() public {
        c = new FunctionReturnParameterComplex();
    }

    function test_f() public {
        (uint r1, uint r2, uint r3) = c.f();
        assert(r1 == 0x10);
        assert(r2 == 0x20);
        assert(r3 == 0x40);
        assert(c.x() == 1);
    }

    function test_shouldFail_nonzero_i1() public {
        vm.expectRevert(bytes("a is not zero"));
        c.shouldFail(1);
    }

    function test_shouldFail_zero_i1() public {
        // x is already 1 from prior state; shouldFail(0) fails because b = r+20 = 20 != 0
        vm.expectRevert(bytes("b is not zero"));
        c.shouldFail(0);
    }

    function test_g() public {
        c.f(); // makes x = 1
        uint r = c.g();
        assert(r == 5);
        assert(c.x() == 5);
    }
}
