// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataStructAssign.sol";

contract CalldataStructAssignTest is Test {
    CalldataStructAssign c;

    function setUp() public {
        c = new CalldataStructAssign();
    }

    // f((uint256),(uint256,uint256)): 0x42, 0x07, 0x77 -> 0x07, 0x42
    // s has x=0x42, s2 has x=0x07 y=0x77
    // assembly: s := s2 -> s.offset = s2.offset = position of s2 in calldata
    // assembly: s2 := 4 -> s2.offset = 4 (absolute calldata offset)
    // After: s reads from s2's original position -> s.x = 0x07
    // s2 reads from absolute position 4 -> s2.x = s.x (original) = 0x42
    function test_f() public {
        (uint256 r, uint256 r2) = c.f(
            CalldataStructAssign.S(0x42),
            CalldataStructAssign.S2(0x07, 0x77)
        );
        assertEq(r, 0x07);
        assertEq(r2, 0x42);
    }
}
