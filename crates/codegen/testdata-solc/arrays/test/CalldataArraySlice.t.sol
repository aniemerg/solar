// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataArraySlice.sol";

contract CalldataArraySliceTest {
    CalldataArraySlice c;

    function setUp() public {
        c = new CalldataArraySlice();
    }

    function test_CalldataArraySlice_g() public view {
        uint256[] memory arr = new uint256[](4);
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        arr[3] = 4;
        (uint256 a, uint256 b) = c.g(arr);
        assert(a == 4);
        assert(b == 1);
    }

    function test_CalldataArraySlice_h() public view {
        uint256[] memory arr = new uint256[](4);
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        arr[3] = 4;
        (uint256 a, uint256 b) = c.h(arr, 1, 3);
        assert(a == 2);
        assert(b == 2);
    }
}
