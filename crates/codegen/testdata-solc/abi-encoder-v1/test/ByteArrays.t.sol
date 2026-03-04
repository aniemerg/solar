// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ByteArrays.sol";

// Ported from: abiEncoderV1/byte_arrays.sol
// f(uint256,bytes,uint256): 6, 0x60, 9, 7, "abcdefg" -> 6, 7, "d", 9
// f_external(uint256,bytes,uint256): 6, 0x60, 9, 7, "abcdefg" -> 6, 7, "d", 9
contract ByteArraysTest is Test {
    ByteArrays c;

    function setUp() public {
        c = new ByteArrays();
    }

    function test_f() public {
        (uint a, uint len, bytes1 ch, uint cv) = c.f(6, "abcdefg", 9);
        assertEq(a, 6);
        assertEq(len, 7);
        assertEq(ch, bytes1("d")); // index 3 of "abcdefg"
        assertEq(cv, 9);
    }

    function test_f_external() public {
        (uint a, uint len, bytes1 ch, uint cv) = c.f_external(6, "abcdefg", 9);
        assertEq(a, 6);
        assertEq(len, 7);
        assertEq(ch, bytes1("d")); // index 3 of "abcdefg"
        assertEq(cv, 9);
    }
}
