// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ArrayPushNestedFromMemory.sol";

contract ArrayPushNestedFromMemoryTest is Test {
    function test_ArrayPushNestedFromMemory() public {
        ArrayPushNestedFromMemory c = new ArrayPushNestedFromMemory();
        assertEq(c.f(), 1);
    }
}
