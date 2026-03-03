// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/RequireErrorStringLiteral.sol";

contract RequireErrorStringLiteralTest is Test {
    RequireErrorStringLiteral c;

    function setUp() public {
        c = new RequireErrorStringLiteral();
    }

    function test_RequireErrorStringLiteral_f() public {
        vm.expectRevert(abi.encodeWithSelector(CustomErrorString.selector, "errorReason"));
        c.f();
    }

    function test_RequireErrorStringLiteral_g() public {
        vm.expectRevert(abi.encodeWithSelector(CustomErrorString.selector, "anotherReason"));
        c.g();
    }
}
