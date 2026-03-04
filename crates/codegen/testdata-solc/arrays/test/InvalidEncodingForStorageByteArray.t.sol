// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InvalidEncodingForStorageByteArray.sol";

contract InvalidEncodingForStorageByteArrayTest is Test {
    InvalidEncodingForStorageByteArray c;

    function setUp() public {
        c = new InvalidEncodingForStorageByteArray();
    }

    function test_normalOps() public {
        // Initial state: x = "abc"
        assertEq(c.x(), "abc");
        assertEq(c.abiEncode(), "abc");
        assertEq(c.abiEncodePacked(), "abc");
        assertEq(c.copyToMemory(), "abc");
        assertEq(c.indexAccess(), bytes1("a"));

        c.arrayPushEmpty();
        c.arrayPush();
        // x is now "abc\0t" (5 bytes)
        assertEq(c.x().length, 5);

        c.arrayPop();
        // x is now "abc\0" (4 bytes)
        c.assignToLong();
        assertEq(c.x(), "1234567890123456789012345678901234567");

        c.assignTo();
        assertEq(c.x(), "def");

        c.copyFromStorageShort();
        assertEq(c.x(), "abc");

        c.copyFromStorageLong();
        assertEq(c.x(), "1234567890123456789012345678901234567");

        c.copyToStorage();
        assertEq(c.x(), "1234567890123456789012345678901234567");
        assertEq(c.y(), "1234567890123456789012345678901234567");

        c.del();
        assertEq(c.x(), "");
    }

    function test_invalidateXLong() public {
        c.invalidateXLong();
        // After invalidating, all ops on x should revert (panic 0x22)
        vm.expectRevert();
        c.x();

        vm.expectRevert();
        c.abiEncode();

        vm.expectRevert();
        c.copyToMemory();

        vm.expectRevert();
        c.indexAccess();

        vm.expectRevert();
        c.arrayPush();

        vm.expectRevert();
        c.arrayPop();

        vm.expectRevert();
        c.assignTo();

        vm.expectRevert();
        c.copyFromStorageShort();

        vm.expectRevert();
        c.del();
    }

    function test_invalidateXShort() public {
        c.invalidateXShort();
        // After invalidating short encoding, ops on x should revert (panic 0x22)
        vm.expectRevert();
        c.x();

        vm.expectRevert();
        c.abiEncode();

        vm.expectRevert();
        c.copyToMemory();

        vm.expectRevert();
        c.indexAccess();
    }
}
