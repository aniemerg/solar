// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ArraySliceCalldataToStorage.sol";

contract ArraySliceCalldataToStorageTest is Test {
    function test_ArraySliceCalldataToStorage() public {
        ArraySliceCalldataToStorage c = new ArraySliceCalldataToStorage();
        // b=[1,2,3,4], start=1, end=3 -> s=[2,3], return s[0]=2
        int[] memory b = new int[](4);
        b[0] = 1; b[1] = 2; b[2] = 3; b[3] = 4;
        assertEq(c.f(b, 1, 3), 2);
    }
}
