// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InlineMemberInitInheritence.sol";

contract InlineMemberInitInheritenceTest {
    InlineMemberInitInheritence c;

    function setUp() public {
        c = new InlineMemberInitInheritence();
    }

    function test_getBMember() public {
        assert(c.getBMember() == 5);
    }

    function test_getDMember() public {
        assert(c.getDMember() == 6);
    }
}
