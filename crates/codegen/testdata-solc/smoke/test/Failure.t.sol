// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/Failure.sol";

contract FailureTest is Test {
    Failure c;

    function setUp() public {
        c = new Failure();
    }

    function test_Failure_e() public {
        vm.expectRevert("Transaction failed.");
        c.e();
    }

    function test_Failure_f() public {
        vm.expectRevert();
        c.f(false);
    }

    function test_Failure_g() public {
        vm.expectRevert("Value is false.");
        c.g(false);
    }

    function test_Failure_h() public {
        vm.expectRevert();
        c.h();
    }
}
