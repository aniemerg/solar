// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ArraySliceCalldataToMemory.sol";

contract ArraySliceCalldataToMemoryTest is Test {
    function test_f() public {
        ArraySliceCalldataToMemory c = new ArraySliceCalldataToMemory();
        // b=[1,2,3,4], start=1, end=3 -> b[1:3]=[2,3], return [b[1:3]][0][0] = 2
        int[] memory b = new int[](4);
        b[0] = 1; b[1] = 2; b[2] = 3; b[3] = 4;
        assertEq(c.f(b, 1, 3), 2);
    }

    function test_g() public {
        ArraySliceCalldataToMemory c = new ArraySliceCalldataToMemory();
        // b=[1,2,3,4], start=1, end=3 -> [2,3]
        int[] memory b = new int[](4);
        b[0] = 1; b[1] = 2; b[2] = 3; b[3] = 4;
        int[] memory result = c.g(b, 1, 3);
        assertEq(result.length, 2);
        assertEq(result[0], 2);
        assertEq(result[1], 3);
    }

    function test_h() public {
        ArraySliceCalldataToMemory c = new ArraySliceCalldataToMemory();
        // b=[1,2,3,4], start=1, end=3 -> [2,3]
        int[] memory b = new int[](4);
        b[0] = 1; b[1] = 2; b[2] = 3; b[3] = 4;
        int[] memory result = c.h(b, 1, 3);
        assertEq(result.length, 2);
        assertEq(result[0], 2);
        assertEq(result[1], 3);
    }
}
