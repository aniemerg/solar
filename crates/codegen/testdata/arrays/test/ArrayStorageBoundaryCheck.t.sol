// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ArrayStorageBoundaryCheck.sol";

contract ArrayStorageBoundaryCheckTest is Test {
    ArrayStorageBoundaryCheck c;

    function setUp() public {
        c = new ArrayStorageBoundaryCheck();
    }

    function test_ArrayStorageBoundaryCheck_InBounds() public {
        assert(c.checkBoundaryCheck(10, 9) == 0);
        assert(c.checkBoundaryCheck(256, 2) == 0);
        assert(c.checkBoundaryCheck(256, 255) == 0);
    }

    function test_ArrayStorageBoundaryCheck_OutOfBounds() public {
        vm.expectRevert();
        c.checkBoundaryCheck(10, 11);
    }
}
