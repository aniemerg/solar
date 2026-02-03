// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/RequireErrorMultipleArguments.sol";

contract RequireErrorMultipleArgumentsTest is Test {
    RequireErrorMultipleArguments c;

    function setUp() public {
        c = new RequireErrorMultipleArguments();
    }

    function test_RequireErrorMultipleArguments_f() public {
        vm.expectRevert(abi.encodeWithSelector(CustomErrorMulti.selector, 1, "two", 3));
        c.f();
    }

    function test_RequireErrorMultipleArguments_g() public {
        vm.expectRevert(abi.encodeWithSelector(CustomErrorMulti.selector, 4, "five", 6));
        c.g();
    }
}
