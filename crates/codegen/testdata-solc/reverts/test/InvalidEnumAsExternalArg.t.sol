// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/InvalidEnumAsExternalArg.sol";

contract InvalidEnumAsExternalArgTest is Test {
    InvalidEnumAsExternalArg c;

    function setUp() public {
        c = new InvalidEnumAsExternalArg();
    }

    function test_run() public {
        // Passing an out-of-range enum value as external argument triggers Panic(0x21)
        vm.expectRevert();
        c.run();
    }
}
