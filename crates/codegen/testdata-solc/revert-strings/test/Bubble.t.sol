// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/Bubble.sol";

contract BubbleTest is Test {
    Bubble c;

    function setUp() public {
        c = new Bubble();
    }

    function test_Bubble_RevertBubbles() public {
        // f() calls a.g() which reverts with "fail"; revert bubbles up
        vm.expectRevert();
        c.f();
    }
}
