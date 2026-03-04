// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataStructMemberOffset.sol";

contract CalldataStructMemberOffsetTest is Test {
    CalldataStructMemberOffset c;

    function setUp() public {
        c = new CalldataStructMemberOffset();
    }

    function test_f() public {
        // f() -> 11, 11
        (uint256 a, uint256 b) = c.f();
        assertEq(a, 11);
        assertEq(b, 11);
    }
}
