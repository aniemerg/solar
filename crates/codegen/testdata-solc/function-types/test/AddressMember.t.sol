// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AddressMember.sol";

contract AddressMemberTest {
    function test_addressMember() public {
        AddressMember c = new AddressMember();
        (address a1, address a2) = c.f();
        assert(a1 == address(0x1234));
        assert(a2 == address(0x1234));
    }
}
