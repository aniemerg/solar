// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EmptyRevert.sol";

contract EmptyRevertTest is Test {
    EmptyRevert c;

    function setUp() public {
        c = new EmptyRevert();
    }

    function test_EmptyRevert_f() public {
        // revert("") produces an Error(string) revert with empty string
        vm.expectRevert();
        c.f();
    }

    function test_EmptyRevert_g_EmptyString() public {
        vm.expectRevert();
        c.g("");
    }
}
