// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EnumReferencing.sol";

contract EnumReferencingTest {
    EnumReferencing c;

    function setUp() public {
        c = new EnumReferencing();
    }

    function test_EnumReferencing() public view {
        assert(uint256(c.f()) == 3);
        assert(uint256(c.g()) == 3);
        assert(uint256(c.h()) == 1);
        assert(uint256(c.x()) == 1);
        assert(uint256(c.y()) == 3);
    }
}
