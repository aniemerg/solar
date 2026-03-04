// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/DynamicNestedArrays.sol";

contract DynamicNestedArraysTest is Test {
    DynamicNestedArrays c;

    function setUp() public {
        c = new DynamicNestedArrays();
    }

    function test_test() public {
        // test() -> 12, 3, 4, 0x66, 5, 0x85, 13
        (uint a, uint bl, uint b1l, uint b11, uint c1l, uint c111, uint d) = c.test();
        assertEq(a, 12);
        assertEq(bl, 3);
        assertEq(b1l, 4);
        assertEq(b11, 0x66);
        assertEq(c1l, 5);
        assertEq(c111, 0x85);
        assertEq(d, 13);
    }
}
