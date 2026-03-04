// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/Array3dAssignment.sol";

contract Array3dAssignmentTest is Test {
    function test_Array3dAssignment() public {
        Array3dAssignment c = new Array3dAssignment();
        assertEq(c.f(42), 42);
    }
}
