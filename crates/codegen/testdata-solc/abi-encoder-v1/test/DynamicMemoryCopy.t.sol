// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/DynamicMemoryCopy.sol";

// Ported from: abiEncoderV1/dynamic_memory_copy.sol
// Tests that abi.decode always produces distinct memory regions for each decoded array
// test(bytes): various -> false, false
contract DynamicMemoryCopyTest is Test {
    DynamicMemoryCopy c;

    function setUp() public {
        c = new DynamicMemoryCopy();
    }

    function test_two_empty_arrays() public {
        // 0x20, 0x80, 0x40, 0x60, 0, 0
        // Two arrays, both with length 0, tail pointers different
        uint256[] memory arr1 = new uint256[](0);
        uint256[] memory arr2 = new uint256[](0);
        bytes memory buf = abi.encode(arr1, arr2);
        (bool same, bool inplace) = c.check(buf);
        assertFalse(same);
        assertFalse(inplace);
    }

    function test_two_arrays_one_element_each() public {
        uint256[] memory arr1 = new uint256[](1);
        arr1[0] = 0x42;
        uint256[] memory arr2 = new uint256[](1);
        arr2[0] = 0x42;
        bytes memory buf = abi.encode(arr1, arr2);
        (bool same, bool inplace) = c.check(buf);
        assertFalse(same);
        assertFalse(inplace);
    }

    function test_overlapping_tail_pointers() public {
        // 0x20, 0x80, 0x40, 0x40, 1, 0x42
        // Both tail pointers point to the same data
        bytes memory buf = abi.encodePacked(
            uint256(0x40),  // offset to arr1
            uint256(0x40),  // offset to arr2 (same location!)
            uint256(1),     // arr1 length = 1
            uint256(0x42)   // arr1[0] = 0x42
        );
        (bool same, bool inplace) = c.check(buf);
        assertFalse(same);
        assertFalse(inplace);
    }

    function test_short_buffer() public {
        // 0x20, 0x60, 0x40, 0x40, 0
        bytes memory buf = abi.encodePacked(
            uint256(0x40),  // offset to arr1
            uint256(0x40),  // offset to arr2 (same location!)
            uint256(0)      // arr1 length = 0
        );
        (bool same, bool inplace) = c.check(buf);
        assertFalse(same);
        assertFalse(inplace);
    }
}
