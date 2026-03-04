// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/DynamicMultiArrayCleanup.sol";

contract DynamicMultiArrayCleanupTest is Test {
    function test_DynamicMultiArrayCleanup() public {
        DynamicMultiArrayCleanup c = new DynamicMultiArrayCleanup();
        assertEq(c.getDataLength(), 0);
        assertEq(c.fill(), 8);
        assertEq(c.getDataLength(), 3);
        c.clear();
        assertEq(c.getDataLength(), 0);
    }
}
