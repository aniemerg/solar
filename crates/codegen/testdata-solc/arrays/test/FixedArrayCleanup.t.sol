// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/FixedArrayCleanup.sol";

contract FixedArrayCleanupTest is Test {
    function test_FixedArrayCleanup() public {
        FixedArrayCleanup c = new FixedArrayCleanup();
        // Initially all zeros
        for (uint i = 0; i < 20; i++) {
            assertEq(c.get(i), 0);
        }
        c.fill();
        for (uint i = 0; i < 20; i++) {
            assertEq(c.get(i), i + 1);
        }
        c.clear();
        for (uint i = 0; i < 20; i++) {
            assertEq(c.get(i), 0);
        }
    }
}
