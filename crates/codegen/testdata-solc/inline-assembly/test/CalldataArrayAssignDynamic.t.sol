// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayAssignDynamic.sol";

contract CalldataArrayAssignDynamicTest is Test {
    CalldataArrayAssignDynamic c;

    function setUp() public {
        c = new CalldataArrayAssignDynamic();
    }

    // f(uint256[2][]): 0x0, 1, 8, 7, 6, 5 -> 0x20, 2, 8, 7, 6, 5
    function test_f() public {
        // Call f with a dynamic array of uint[2], but override offset/length in assembly
        // Input: offset=0, length=1 (ignored), followed by data: 8,7,6,5
        // The function reassigns x.offset=0x44, x.length=2
        // 0x44 = 68 bytes into calldata = 4 (selector) + 64 (ABI head) + 0 ... hmm
        // Let's use a raw call to replicate the exact calldata from the test
        // f(uint256[2][]): 0x0, 1, 8, 7, 6, 5
        // ABI encoding of uint[2][]: offset=0x0, length=1, then data 8,7,6,5
        // The assembly overrides: x.offset=0x44, x.length=2
        // 0x44 = 68 = 4 (selector) + 64 bytes of calldata prefix -> that's at byte 68 of msg.data
        // So x reads 2 pairs from calldata[0x44:] = calldata positions 0x44..
        // In calldata: [0..3] selector, [4..35] = 0x0 (array offset), [36..67] = 1 (length)
        // [68..99] = 8, [100..131] = 7, [132..163] = 6, [164..195] = 5
        // x.offset=0x44=68, x.length=2 -> reads from calldata[68]: (8,7), (6,5)
        // Expected result: memory array with 2 elements: [8,7] and [6,5]
        bytes memory callData = abi.encodeWithSelector(
            c.f.selector,
            new uint[2][](0) // placeholder - we'll craft raw calldata
        );
        // Craft raw calldata: f(uint256[2][]): offset=0, length=1, data: 8,7,6,5
        bytes memory raw = abi.encodePacked(
            c.f.selector,
            uint256(0),   // offset of array
            uint256(1),   // length of array
            uint256(8),
            uint256(7),
            uint256(6),
            uint256(5)
        );
        (bool ok, bytes memory ret) = address(c).call(raw);
        assertTrue(ok);
        // Decode result: uint[2][] memory with 2 elements
        uint[2][] memory r = abi.decode(ret, (uint[2][]));
        assertEq(r.length, 2);
        assertEq(r[0][0], 8);
        assertEq(r[0][1], 7);
        assertEq(r[1][0], 6);
        assertEq(r[1][1], 5);
    }
}
