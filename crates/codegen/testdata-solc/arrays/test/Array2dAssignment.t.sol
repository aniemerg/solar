// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/Array2dAssignment.sol";

contract Array2dAssignmentTest is Test {
    function test_Array2dAssignment() public {
        Array2dAssignment c = new Array2dAssignment();
        assertEq(c.f(42), 42);
    }
}
