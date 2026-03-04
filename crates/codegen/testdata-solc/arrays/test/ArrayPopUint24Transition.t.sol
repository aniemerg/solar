// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ArrayPopUint24Transition.sol";

contract ArrayPopUint24TransitionTest is Test {
    function test_ArrayPopUint24Transition() public {
        ArrayPopUint24Transition c = new ArrayPopUint24Transition();
        (uint24 x, uint24 y) = c.runTest();
        assertEq(x, 20);
        assertEq(y, 10);
    }
}
