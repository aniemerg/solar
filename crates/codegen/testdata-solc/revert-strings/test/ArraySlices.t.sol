// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ArraySlices.sol";

contract ArraySlicesTest is Test {
    ArraySlices c;

    function setUp() public {
        c = new ArraySlices();
    }

    function test_ArraySlices_StartAfterEnd() public {
        // start=2, end=1 on [1,2,3] -> "Slice starts after end"
        uint256[] memory arr = new uint256[](3);
        arr[0] = 1; arr[1] = 2; arr[2] = 3;
        vm.expectRevert();
        c.f(2, 1, arr);
    }

    function test_ArraySlices_SliceGreaterThanLength() public {
        // start=1, end=5 on [1,2,3] -> "Slice is greater than length"
        uint256[] memory arr = new uint256[](3);
        arr[0] = 1; arr[1] = 2; arr[2] = 3;
        vm.expectRevert();
        c.f(1, 5, arr);
    }
}
