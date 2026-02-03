// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UsingInheritedEnum.sol";

contract UsingInheritedEnumTest {
    UsingInheritedEnum c;

    function setUp() public {
        c = new UsingInheritedEnum();
    }

    function test_UsingInheritedEnum() public view {
        assert(uint256(c.answer()) == 1);
    }
}
