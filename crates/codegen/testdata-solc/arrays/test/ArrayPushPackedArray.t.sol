// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ArrayPushPackedArray.sol";

contract ArrayPushPackedArrayTest is Test {
    function test_ArrayPushPackedArray() public {
        ArrayPushPackedArray c = new ArrayPushPackedArray();
        (uint80 a, uint80 b, uint80 d, uint80 e) = c.runTest();
        assertEq(a, 1);
        assertEq(b, 2);
        assertEq(d, 3);
        assertEq(e, 4);
    }
}
