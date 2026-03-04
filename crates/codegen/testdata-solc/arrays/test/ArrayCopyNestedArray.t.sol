// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArrayCopyNestedArray.sol";

contract ArrayCopyNestedArrayTest {
    function test_ArrayCopyNestedArray() public {
        ArrayCopyNestedArray c = new ArrayCopyNestedArray();
        // test(uint256[2][]): 32, 3, 7, 8, 9, 10, 11, 12 -> 10
        // Input: 3 elements of uint256[2]: [7,8], [9,10], [11,12]
        uint256[2][] memory d = new uint256[2][](3);
        d[0][0] = 7; d[0][1] = 8;
        d[1][0] = 9; d[1][1] = 10;
        d[2][0] = 11; d[2][1] = 12;
        uint256 result = c.runTest(d);
        assert(result == 10);
    }
}
