// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ArrayPush.sol";

contract ArrayPushTest is Test {
    function test_ArrayPush() public {
        ArrayPush c = new ArrayPush();
        (uint256 x, uint256 y, uint256 z, uint256 l) = c.test();
        assertEq(x, 5);
        assertEq(y, 4);
        assertEq(z, 3);
        assertEq(l, 3);
    }
}
