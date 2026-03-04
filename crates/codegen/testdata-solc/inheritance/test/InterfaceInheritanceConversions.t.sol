// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InterfaceInheritanceConversions.sol";

contract InterfaceInheritanceConversionsTest {
    C c;

    function setUp() public {
        c = new C();
    }

    function test_InterfaceInheritanceConversions() public {
        assert(c.convertParent() == 1);
        (uint256 a1, uint256 a2) = c.convertSubA();
        assert(a1 == 1);
        assert(a2 == 2);
        (uint256 b1, uint256 b2) = c.convertSubB();
        assert(b1 == 1);
        assert(b2 == 3);
    }
}
