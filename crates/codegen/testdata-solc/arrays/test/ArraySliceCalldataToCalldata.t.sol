// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "forge-std/Test.sol";
import "../src/ArraySliceCalldataToCalldata.sol";

contract ArraySliceCalldataToCalldataTest is Test {
    function test_g() public {
        ArraySliceCalldataToCalldata c = new ArraySliceCalldataToCalldata();
        // g(c, 1, 3) returns c[1:3] which is elements at index 1 and 2
        // input: 4 elements: [55,(1,2,3),66], [66,(2,3,4),77], [77,(3,4,5),88], [88,(4,5,6),99]
        // slice [1:3] = elements [66,(2,3,4),77] and [77,(3,4,5),88]
        ArraySliceCalldataToCalldata.S[] memory arr = new ArraySliceCalldataToCalldata.S[](4);
        arr[0].p1 = 55; arr[0].a = [uint256(1), 2, 3]; arr[0].p2 = 66;
        arr[1].p1 = 66; arr[1].a = [uint256(2), 3, 4]; arr[1].p2 = 77;
        arr[2].p1 = 77; arr[2].a = [uint256(3), 4, 5]; arr[2].p2 = 88;
        arr[3].p1 = 88; arr[3].a = [uint256(4), 5, 6]; arr[3].p2 = 99;
        ArraySliceCalldataToCalldata.S[] memory result = c.g(arr, 1, 3);
        assertEq(result.length, 2);
        assertEq(result[0].p1, 66);
        assertEq(result[0].a[0], 2);
        assertEq(result[0].a[1], 3);
        assertEq(result[0].a[2], 4);
        assertEq(result[0].p2, 77);
        assertEq(result[1].p1, 77);
        assertEq(result[1].a[0], 3);
        assertEq(result[1].a[1], 4);
        assertEq(result[1].a[2], 5);
        assertEq(result[1].p2, 88);
    }

    function test_g1() public {
        ArraySliceCalldataToCalldata c = new ArraySliceCalldataToCalldata();
        // g1(c, 1, 3) returns c[1:3]
        // input: 4 elements: [1,2,3], [4,5,6], [7,8,9], [10,11,12]
        // slice [1:3] = [4,5,6], [7,8,9]
        uint256[3][] memory arr = new uint256[3][](4);
        arr[0] = [uint256(1), 2, 3];
        arr[1] = [uint256(4), 5, 6];
        arr[2] = [uint256(7), 8, 9];
        arr[3] = [uint256(10), 11, 12];
        uint256[3][] memory result = c.g1(arr, 1, 3);
        assertEq(result.length, 2);
        assertEq(result[0][0], 4);
        assertEq(result[0][1], 5);
        assertEq(result[0][2], 6);
        assertEq(result[1][0], 7);
        assertEq(result[1][1], 8);
        assertEq(result[1][2], 9);
    }
}
