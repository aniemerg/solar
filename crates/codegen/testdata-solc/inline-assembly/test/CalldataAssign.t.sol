// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataAssign.sol";

contract CalldataAssignTest is Test {
    CalldataAssign c;

    function setUp() public {
        c = new CalldataAssign();
    }

    // f(bytes): 0x20, 0, 0 -> 0x20, 3, 0x5754f80000000000000000000000000000000000000000000000000000000000
    // The assembly reassigns x.offset=1, x.length=3
    // offset=1 means starting at byte 1 of msg.data (right after length prefix byte)
    // msg.data: [0..3]=selector=0x26121ff0..., [4..35]=0x20, [36..67]=0, [68..99]=0
    // x.offset=1: reading from msg.data[1] = bytes starting at position 1
    // First 4 bytes of selector are typically 0x26121ff0 or similar
    // Actually x.offset=1 means offset 1 byte into calldata (from start of msg.data)
    // The test expects: 3 bytes at offset 1 = bytes[1..4] of msg.data
    // msg.data[0] = 0x26, msg.data[1] = 0x12, msg.data[2] = 0x1f, msg.data[3] = 0xf0
    // So reading 3 bytes starting at offset 1: 0x121ff0
    // Wait: expected is 0x5754f800... Let me re-read.
    // The calldata sent by solc tester is: f(bytes) with data 0x20,0,0
    // The raw calldata (excluding selector) is: 0x20 (offset), 0 (length), 0 (padding data)
    // selector for f(bytes) would be keccak256("f(bytes)")[0:4]
    // x.offset := 1 reads from calldata offset 1 (absolute msg.data offset 1)
    // selector for f(bytes) = 0xae78c4dd? Let me not guess and instead test the behavior:
    // We call with bytes("") (empty), the assembly ignores it and reads 3 bytes at calldata offset 1
    // The test verifies that calling f with specific data produces specific output.
    // Let's use low-level call with exact calldata from the test spec:
    // calldata = selector || 0x20 || 0 || 0
    function test_f() public {
        bytes memory raw = abi.encodePacked(
            c.f.selector,
            uint256(0x20),  // offset of bytes param
            uint256(0),     // length
            uint256(0)      // data
        );
        (bool ok, bytes memory ret) = address(c).call(raw);
        assertTrue(ok);
        // x.offset=1 means reading from raw[1..4] = bytes 1,2,3 of selector
        // x.length=3, returns 3 bytes
        bytes memory result = abi.decode(ret, (bytes));
        assertEq(result.length, 3);
        // The 3 bytes are raw[1], raw[2], raw[3] = selector bytes 1,2,3
        bytes4 sel = c.f.selector;
        assertEq(result[0], sel[1]);
        assertEq(result[1], sel[2]);
        assertEq(result[2], sel[3]);
    }
}
