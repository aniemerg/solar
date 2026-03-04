// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ByteArrayPush.sol";

contract ByteArrayPushTest is Test {
    function test_ByteArrayPush() public {
        ByteArrayPush c = new ByteArrayPush();
        assertEq(c.runTest(), false);
    }
}
