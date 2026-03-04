// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ArrayPopArrayTransition.sol";

contract ArrayPopArrayTransitionTest is Test {
    function test_ArrayPopArrayTransition() public {
        ArrayPopArrayTransition c = new ArrayPopArrayTransition();
        (uint x, uint y, uint z) = c.runTest();
        assertEq(x, 1);
        assertEq(y, 2);
        assertEq(z, 3);
    }
}
