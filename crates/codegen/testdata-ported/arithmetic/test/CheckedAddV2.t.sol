// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CheckedAddV2.sol";

contract CheckedAddV2Test is Test {
    CheckedAddV2 c;

    function setUp() public {
        c = new CheckedAddV2();
    }

    function test_CheckedAddV2_Valid() public view {
        assert(c.f(65534, 0) == 0xfffe);
        assert(c.f(65535, 0) == 0xffff);
    }

    function test_CheckedAddV2_Overflow() public {
        vm.expectRevert();
        c.f(65535, 1);
    }
}
