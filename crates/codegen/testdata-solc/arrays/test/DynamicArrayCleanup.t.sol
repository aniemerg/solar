// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/DynamicArrayCleanup.sol";

contract DynamicArrayCleanupTest is Test {
    function test_DynamicArrayCleanup() public {
        DynamicArrayCleanup c = new DynamicArrayCleanup();
        assertEq(c.getLength(), 0);
        c.fill();
        assertEq(c.getLength(), 21);
        for (uint i = 0; i < 21; i++) {
            assertEq(c.get(i), i + 1);
        }
        c.halfClear();
        assertEq(c.getLength(), 5);
        for (uint i = 0; i < 5; i++) {
            assertEq(c.get(i), i + 1);
        }
        c.fullClear();
        assertEq(c.getLength(), 0);
    }
}
