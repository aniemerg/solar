// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/RequireErrorFunctionPointerParameter.sol";

contract RequireErrorFunctionPointerParameterTest is Test {
    RequireErrorFunctionPointerParameter c;

    function setUp() public {
        c = new RequireErrorFunctionPointerParameter();
    }

    function test_RequireErrorFunctionPointerParameter() public {
        // f() -> FAILURE with custom error CustomError(function pointer)
        // selector 0x271b1dfa from the solc test
        vm.expectRevert();
        c.f();
    }
}
