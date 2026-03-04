// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ArraySliceCalldataAsArgumentOfExternalCalls.sol";

contract ArraySliceCalldataAsArgumentOfExternalCallsTest is Test {
    function test_f1_match() public {
        ArraySliceCalldataAsArgumentOfExternalCalls c = new ArraySliceCalldataAsArgumentOfExternalCalls();
        assertTrue(c.f1("abcdefgh", 1, 5, "bcde"));
    }

    function test_f1_nomatch() public {
        ArraySliceCalldataAsArgumentOfExternalCalls c = new ArraySliceCalldataAsArgumentOfExternalCalls();
        assertFalse(c.f1("abcdefgh", 1, 5, "bcdf"));
    }

    function test_f2() public {
        ArraySliceCalldataAsArgumentOfExternalCalls c = new ArraySliceCalldataAsArgumentOfExternalCalls();
        // encode (0x21, "abcdefg") = 33-byte uint, then 7-byte bytes
        bytes memory encoded = abi.encode(uint256(0x21), bytes("abcdefg"));
        (uint256 val, bytes memory b) = c.f2(abi.encodePacked(encoded), 0);
        assertEq(val, 0x21);
        assertEq(b, "abcdefg");
    }

    function test_f3_match() public {
        ArraySliceCalldataAsArgumentOfExternalCalls c = new ArraySliceCalldataAsArgumentOfExternalCalls();
        assertTrue(c.f3("abcdefgh", 1, 5, "bcde"));
    }

    function test_f3_nomatch() public {
        ArraySliceCalldataAsArgumentOfExternalCalls c = new ArraySliceCalldataAsArgumentOfExternalCalls();
        assertFalse(c.f3("abcdefgh", 1, 5, "bcdf"));
    }

    function test_f4_match() public {
        ArraySliceCalldataAsArgumentOfExternalCalls c = new ArraySliceCalldataAsArgumentOfExternalCalls();
        assertTrue(c.f4("abcdefgh", 1, 5, "bcde"));
    }

    function test_f4_nomatch() public {
        ArraySliceCalldataAsArgumentOfExternalCalls c = new ArraySliceCalldataAsArgumentOfExternalCalls();
        assertFalse(c.f4("abcdefgh", 1, 5, "bcdf"));
    }
}
