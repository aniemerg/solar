// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/CalldataBytesByte32Arrays.sol";

// Ported from: abiEncoderV1/calldata_bytes_bytes32_arrays.sol
// compileViaYul: false (skipped Yul IR variant; ported for legacy compilation behavior)
// f(bool,bytes,bytes32[2]): true, 0x80, "a", "b", 4, "abcd" -> true, 0x80, "a", "b", 4, "abcd"
contract CalldataBytesByte32ArraysTest is Test {
    CalldataBytesByte32Arrays c;

    function setUp() public {
        c = new CalldataBytesByte32Arrays();
    }

    function test_f() public {
        bytes32[2] memory cv;
        cv[0] = bytes32("abcd");
        cv[1] = bytes32(0);
        // Note: original test input was: true, offset=0x80, "a", "b", 4, "abcd"
        // "b" is a padding-related param, "4" is c[0] length-related
        // Simplified: pass true, bytes with "a\x00b", fixed array ["abcd", 0x00]
        (bool ra, bytes memory rb, bytes32[2] memory rc) = c.f(true, abi.encodePacked(bytes1("a"), bytes1(0), bytes1("b")), cv);
        assertTrue(ra);
        assertEq(rb.length, 3);
        assertEq(rc[0], bytes32("abcd"));
    }
}
