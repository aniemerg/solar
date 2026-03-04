// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/McopyOverlap.sol";

contract McopyOverlapTest is Test {
    McopyOverlap c;

    function setUp() public {
        c = new McopyOverlap();
    }

    // mcopy_to_right_overlap() -> 0x60 bytes
    // 0x2222...2222 3333...3333 4444...4444 5555...5555 6666...6666 7777...7777 8888...8888 9999...9999 aaaa...aaaa bbbb...bbbb cccc...cccc dddd...dddd
    // copy(dstOffset=0x20, srcOffset=0x10, length=0x30)
    // Source region [0x10..0x40]: bytes 16..64 = second half of word1 + all of word2 + first half of word3
    //   = 3333...3333 4444...4444 5555...5555 (partially)
    // Actually the initial data is 96 bytes = 3 words of 32 bytes each
    // word1: 2222222222222222333333333333333344444444444444445555555555555555
    // word2: 6666666666666666777777777777777788888888888888889999999999999999
    // word3: aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbccccccccccccccccdddddddddddddddd
    // Dst at offset 0x20 (32) into out, src at 0x10 (16), length 0x30 (48)
    // Source bytes[16..64]: second 16 bytes of word1 + first 16 bytes of word2
    //   = 4444444444444444555555555555555566666666666666667777777777777777
    // Copied to dst at bytes[32..80]: overwrites bytes 32..80 of out
    // Result bytes 0..96:
    //   [0..32]:  2222222222222222333333333333333344444444444444445555555555555555 (unchanged)
    //   [32..64]: 4444444444444444555555555555555566666666666666667777777777777777 (copied)
    //   [64..96]: 8888888888888888... but wait, overlap happens during copy
    // mcopy is byte-accurate, copying left-to-right for forward copies
    // Expected from test:
    // 0x2222222222222222333333333333333344444444444444445555555555555555,
    // 0x4444444444444444555555555555555566666666666666667777777777777777,
    // 0x88888888888888889999999999999999ccccccccccccccccdddddddddddddddd
    function test_mcopy_to_right_overlap() public {
        bytes memory result = c.mcopy_to_right_overlap();
        bytes memory expected = abi.encodePacked(
            bytes32(hex"2222222222222222333333333333333344444444444444445555555555555555"),
            bytes32(hex"4444444444444444555555555555555566666666666666667777777777777777"),
            bytes32(hex"88888888888888889999999999999999ccccccccccccccccdddddddddddddddd")
        );
        assertEq(result, expected);
    }

    function test_mcopy_to_left_overlap() public {
        bytes memory result = c.mcopy_to_left_overlap();
        bytes memory expected = abi.encodePacked(
            bytes32(hex"2222222222222222333333333333333366666666666666667777777777777777"),
            bytes32(hex"88888888888888889999999999999999aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbb"),
            bytes32(hex"aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbccccccccccccccccdddddddddddddddd")
        );
        assertEq(result, expected);
    }

    function test_mcopy_in_place() public {
        bytes memory result = c.mcopy_in_place();
        bytes memory expected = abi.encodePacked(
            bytes32(hex"2222222222222222333333333333333344444444444444445555555555555555"),
            bytes32(hex"6666666666666666777777777777777788888888888888889999999999999999"),
            bytes32(hex"aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbccccccccccccccccdddddddddddddddd")
        );
        assertEq(result, expected);
    }

    function test_mcopy_to_right_no_overlap() public {
        bytes memory result = c.mcopy_to_right_no_overlap();
        bytes memory expected = abi.encodePacked(
            bytes32(hex"2222222222222222333333333333333344444444444444445555555555555555"),
            bytes32(hex"6666666666666666777777777777777744444444444444445555555555555555"),
            bytes32(hex"66666666666666667777777777777777ccccccccccccccccdddddddddddddddd")
        );
        assertEq(result, expected);
    }

    function test_mcopy_to_left_no_overlap() public {
        bytes memory result = c.mcopy_to_left_no_overlap();
        bytes memory expected = abi.encodePacked(
            bytes32(hex"2222222222222222333333333333333388888888888888889999999999999999"),
            bytes32(hex"aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbb88888888888888889999999999999999"),
            bytes32(hex"aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbccccccccccccccccdddddddddddddddd")
        );
        assertEq(result, expected);
    }
}
