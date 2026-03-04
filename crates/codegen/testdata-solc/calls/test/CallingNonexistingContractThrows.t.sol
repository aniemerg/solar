// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/CallingNonexistingContractThrows.sol";

contract CallingNonexistingContractThrowsTest is Test {
    CallingNonexistingContractThrows c;

    function setUp() public {
        c = new CallingNonexistingContractThrows();
    }

    function test_f_reverts() public {
        vm.expectRevert();
        c.f();
    }

    function test_g_reverts() public {
        vm.expectRevert();
        c.g();
    }

    function test_h_returns_7() public {
        assert(c.h() == 7);
    }
}
