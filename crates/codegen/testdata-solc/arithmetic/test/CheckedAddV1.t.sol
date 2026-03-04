// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CheckedAddV1.sol";

contract CheckedAddV1Test is Test {
    CheckedAddV1 c;

    function setUp() public {
        c = new CheckedAddV1();
    }

    function test_CheckedAddV1_Valid() public view {
        assert(c.f(65534, 0) == 0xfffe);
        assert(c.f(65535, 0) == 0xffff);
    }

    function test_CheckedAddV1_Overflow() public {
        vm.expectRevert();
        c.f(65535, 1);
    }
}
