// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataOffsetRead.sol";

contract CalldataOffsetReadTest is Test {
    CalldataOffsetRead c;

    function setUp() public {
        c = new CalldataOffsetRead();
    }

    // f(bytes): 0x20, 0, 0 -> 0x44
    // ABI: selector(4) + offset_to_bytes(32) + bytes_length(32) + bytes_data(32)
    //   = 4 + 32 + 32 + 0 = 68
    // bytes data starts at offset 0x20 from after selector = 0x24 from start
    // Actually offset to the bytes content (after length): 4 + 32 + 32 = 68 = 0x44
    function test_f_bytes() public {
        bytes memory raw = abi.encodePacked(
            bytes4(keccak256("f(bytes)")),
            uint256(0x20),  // offset
            uint256(0),     // length
            uint256(0)      // padding
        );
        (bool ok, bytes memory ret) = address(c).call(raw);
        assertTrue(ok);
        uint r = abi.decode(ret, (uint));
        assertEq(r, 0x44);
    }

    // f(bytes): 0x22, 0, 0, 0 -> 0x46
    // offset=0x22 means bytes data starts at 4+0x22=0x26 from calldata start... wait
    // Actually in ABI, offset is from the start of the ABI-encoded data (after selector)
    // So offset=0x22 -> bytes_length at position 4+0x22=0x26, content at 4+0x22+32=0x46
    function test_f_bytes_offset22() public {
        bytes memory raw = abi.encodePacked(
            bytes4(keccak256("f(bytes)")),
            uint256(0x22),  // offset
            uint256(0),     // extra padding word
            uint256(0),     // length at position 0x22 from ABI start
            uint256(0)      // padding
        );
        (bool ok, bytes memory ret) = address(c).call(raw);
        assertTrue(ok);
        uint r = abi.decode(ret, (uint));
        assertEq(r, 0x46);
    }

    // f(uint256,bytes,uint256): 7, 0x60, 8, 2, 0 -> 0x84, 2
    // ABI: sel(4) + uint(32) + offset(32) + uint(32) + len(32) + data(32)
    // = 4 + 32 + 32 + 32 + 32 + 32 = 164 = ..
    // offset=0x60 from ABI start -> absolute position of bytes length = 4+0x60=0x64
    // content at 4+0x60+32 = 4+0x60+0x20 = 0x84
    // length = 2
    function test_f2_with_args() public {
        bytes memory raw = abi.encodePacked(
            bytes4(keccak256("f2(uint256,bytes,uint256)")),
            uint256(7),     // first uint
            uint256(0x60),  // offset to bytes
            uint256(8),     // third uint
            uint256(2),     // bytes length
            uint256(0)      // bytes data
        );
        (bool ok, bytes memory ret) = address(c).call(raw);
        assertTrue(ok);
        (uint r, uint v) = abi.decode(ret, (uint, uint));
        assertEq(r, 0x84);
        assertEq(v, 2);
    }

    // f(uint256,bytes,uint256): 0, 0, 0 -> 0x24, 0x00
    // offset=0 from ABI start -> bytes length at 4+0=0x04, content at 4+0+32=0x24
    // length = 0
    function test_f2_zeros() public {
        bytes memory raw = abi.encodePacked(
            bytes4(keccak256("f2(uint256,bytes,uint256)")),
            uint256(0),  // first uint
            uint256(0),  // offset = 0 (bytes starts at absolute offset 4+0=4)
            uint256(0)   // third uint (at position 0 from ABI start, this is at 4)
        );
        (bool ok, bytes memory ret) = address(c).call(raw);
        assertTrue(ok);
        (uint r, uint v) = abi.decode(ret, (uint, uint));
        assertEq(r, 0x24);
        assertEq(v, 0);
    }
}
