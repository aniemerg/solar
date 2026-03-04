// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ByteArrayPushTransition.sol";

contract ByteArrayPushTransitionTest is Test {
    function test_ByteArrayPushTransition() public {
        ByteArrayPushTransition c = new ByteArrayPushTransition();
        assertEq(c.runTest(), 0);
    }
}
