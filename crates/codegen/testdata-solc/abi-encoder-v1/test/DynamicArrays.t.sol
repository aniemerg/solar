// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/DynamicArrays.sol";

// Ported from: abiEncoderV1/dynamic_arrays.sol
// f(uint256,uint16[],uint256): 6, 0x60, 9, 7, 11, 12, 13, 14, 15, 16, 17 -> 7, 17, 9
// b = [11, 12, 13, 14, 15, 16, 17] (7 elements), b[6]=17
contract DynamicArraysTest is Test {
    DynamicArrays c;

    function setUp() public {
        c = new DynamicArrays();
    }

    function test_f() public {
        uint16[] memory b = new uint16[](7);
        b[0] = 11;
        b[1] = 12;
        b[2] = 13;
        b[3] = 14;
        b[4] = 15;
        b[5] = 16;
        b[6] = 17;

        (uint len, uint val, uint cv) = c.f(6, b, 9);
        assertEq(len, 7);
        assertEq(val, 17);
        assertEq(cv, 9);
    }
}
