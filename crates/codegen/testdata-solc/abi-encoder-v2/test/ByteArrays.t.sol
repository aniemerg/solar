// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ByteArrays.sol";

contract ByteArraysTest is Test {
    ByteArrays c;

    function setUp() public {
        c = new ByteArrays();
    }

    function test_f() public {
        // f(uint256,bytes,uint256): 6, 0x60, 9, 7, "abcdefg" -> 6, 7, "d", 9
        bytes memory b = "abcdefg";
        (uint retA, uint retLen, bytes1 retB3, uint retC) = c.f(6, b, 9);
        assertEq(retA, 6);
        assertEq(retLen, 7);
        assertEq(retB3, "d"); // b[3] = 'd'
        assertEq(retC, 9);
    }

    function test_f_external() public {
        // f_external(uint256,bytes,uint256): 6, 0x60, 9, 7, "abcdefg" -> 6, 7, "d", 9
        bytes memory b = "abcdefg";
        (uint retA, uint retLen, bytes1 retB3, uint retC) = c.f_external(6, b, 9);
        assertEq(retA, 6);
        assertEq(retLen, 7);
        assertEq(retB3, "d");
        assertEq(retC, 9);
    }
}
