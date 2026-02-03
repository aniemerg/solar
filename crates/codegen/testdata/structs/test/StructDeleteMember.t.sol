// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructDeleteMember.sol";

contract StructDeleteMemberTest {
    StructDeleteMember c;

    function setUp() public {
        c = new StructDeleteMember();
    }

    function test_StructDeleteMember() public {
        assert(c.deleteMember() == 0);
    }
}
