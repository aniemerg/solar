// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/KeccakOptimizationBugString.sol";

contract KeccakOptimizationBugStringTest is Test {
    KeccakOptimizationBugString c;

    function setUp() public {
        c = new KeccakOptimizationBugString();
    }

    // f(string): "" -> false
    function test_f_empty() public {
        assertEq(c.f(""), false);
    }

    // f(string): "hello" -> false
    function test_f_hello() public {
        assertEq(c.f("hello"), false);
    }

    // f(string): long string -> false
    function test_f_long() public {
        // keccak256(s, 32) != keccak256(s, 8) for any non-trivial input
        assertEq(c.f("12345678901234567890123456789012345678901234567"), false);
    }
}
