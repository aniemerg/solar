// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ArrayPopUint16Transition.sol";

contract ArrayPopUint16TransitionTest is Test {
    function test_ArrayPopUint16Transition() public {
        ArrayPopUint16Transition c = new ArrayPopUint16Transition();
        (uint16 x, uint16 y, uint16 z) = c.runTest();
        assertEq(x, 38);
        assertEq(y, 28);
        assertEq(z, 18);
    }
}
