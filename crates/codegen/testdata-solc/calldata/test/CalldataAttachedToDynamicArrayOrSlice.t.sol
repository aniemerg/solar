// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataAttachedToDynamicArrayOrSlice.sol";

contract CalldataAttachedToDynamicArrayOrSliceTest {
    CalldataAttachedToDynamicArrayOrSlice c;

    function setUp() public {
        c = new CalldataAttachedToDynamicArrayOrSlice();
    }

    function test_testArray() public view {
        uint256[] memory a = new uint256[](2);
        a[0] = 66;
        a[1] = 77;
        (uint256 r0, uint256 r1) = c.testArray(7, a, 4);
        assert(r0 == 77);
        assert(r1 == 66);
    }

    function test_testSlice() public view {
        uint256[] memory a = new uint256[](2);
        a[0] = 66;
        a[1] = 77;
        (uint256 r0, uint256 r1) = c.testSlice(7, a, 4);
        assert(r0 == 77);
        assert(r1 == 66);
    }
}
