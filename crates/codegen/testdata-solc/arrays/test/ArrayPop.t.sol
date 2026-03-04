// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ArrayPop.sol";

contract ArrayPopTest is Test {
    function test_ArrayPop() public {
        ArrayPop c = new ArrayPop();
        (uint256 x, uint256 l) = c.runTest();
        assertEq(x, 1);
        assertEq(l, 0);
    }
}
