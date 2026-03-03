// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UsingInheritedEnumExplicitly.sol";

contract UsingInheritedEnumExplicitlyTest {
    UsingInheritedEnumExplicitly c;

    function setUp() public {
        c = new UsingInheritedEnumExplicitly();
    }

    function test_UsingInheritedEnumExplicitly() public view {
        assert(uint256(c.answer()) == 1);
    }
}
