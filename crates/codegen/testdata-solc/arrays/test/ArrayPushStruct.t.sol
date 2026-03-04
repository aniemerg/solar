// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ArrayPushStruct.sol";

contract ArrayPushStructTest is Test {
    function test_ArrayPushStruct() public {
        ArrayPushStruct c = new ArrayPushStruct();
        (uint16 a, uint16 b, uint16 cv, uint16 d) = c.runTest();
        assertEq(a, 2);
        assertEq(b, 3);
        assertEq(cv, 4);
        assertEq(d, 5);
    }
}
