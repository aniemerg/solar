// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ArrayCalldataAssignment.sol";

contract ArrayCalldataAssignmentTest is Test {
    function test_ArrayCalldataAssignment() public {
        ArrayCalldataAssignment c = new ArrayCalldataAssignment();
        // x = [0], y = [1, 2], i = 1 -> x[1] = 2
        uint256[] memory x = new uint256[](1);
        x[0] = 0;
        uint256[] memory y = new uint256[](2);
        y[0] = 1;
        y[1] = 2;
        uint256 result = c.f(x, y, 1);
        assertEq(result, 2);
    }
}
