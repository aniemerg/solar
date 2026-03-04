// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/LongByteArrayCleanupAfterDelete.sol";

contract LongByteArrayCleanupAfterDeleteTest is Test {
    function test_LongByteArrayCleanupAfterDelete() public {
        LongByteArrayCleanupAfterDelete c = new LongByteArrayCleanupAfterDelete();
        assertEq(c.getArrayDataAreaSlot(), 0x290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e563);
        assertEq(c.getCanarySlot(), 0x290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e566);

        (uint256 s0, uint256 s1, uint256 s2, uint256 s3, uint256 len) = c.checkSlots();
        assertEq(s0, 0);
        assertEq(s1, 0);
        assertEq(s2, 0);
        assertEq(s3, type(uint256).max);
        assertEq(len, 0);

        assertEq(c.canaryValue(), type(uint256).max);

        c.fillArray();
        assertEq(c.canaryValue(), type(uint256).max);

        c.deleteArray();
        assertEq(c.canaryValue(), type(uint256).max);
    }
}
