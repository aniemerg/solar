// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CrazyElementaryTypenamesOnStack.sol";

contract CrazyElementaryTypenamesOnStackTest {
    CrazyElementaryTypenamesOnStack c;

    function setUp() public {
        c = new CrazyElementaryTypenamesOnStack();
    }

    function test_f() public {
        // uint256(-7) wraps around: should equal type(uint256).max - 6
        // uint256 wraps around: -7 as uint256 = type(uint256).max - 6
        assert(c.f() == type(uint256).max - 6);
    }
}
