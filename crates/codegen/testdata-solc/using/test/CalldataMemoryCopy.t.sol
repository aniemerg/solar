// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataMemoryCopy.sol";

contract CalldataMemoryCopyTest {
    CalldataMemoryCopy c;

    function setUp() public {
        c = new CalldataMemoryCopy();
    }

    function test_f() public {
        // f(uint256[]): [1, 2, 8] -> 11
        uint[] memory arr = new uint[](3);
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 8;
        assert(c.f(arr) == 11);
    }
}
