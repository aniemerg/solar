// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/InvalidEnumAsExternalRet.sol";

contract InvalidEnumAsExternalRetTest is Test {
    InvalidEnumAsExternalRet c;

    function setUp() public {
        c = new InvalidEnumAsExternalRet();
    }

    function test_return() public {
        // Returning out-of-range enum triggers Panic(0x21)
        vm.expectRevert();
        c.run_return();
    }

    function test_inline_assignment() public {
        vm.expectRevert();
        c.run_inline_assignment();
    }

    function test_assignment() public {
        vm.expectRevert();
        c.run_assignment();
    }
}
