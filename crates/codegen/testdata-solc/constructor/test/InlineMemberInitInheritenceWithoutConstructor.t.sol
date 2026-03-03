// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InlineMemberInitInheritenceWithoutConstructor.sol";

contract InlineMemberInitInheritenceWithoutConstructorTest {
    function test_InlineMemberInitInheritenceWithoutConstructor() public {
        InlineMemberInitDerived d = new InlineMemberInitDerived();
        assert(d.getBMember() == 5);
        assert(d.getDMember() == 6);
    }
}
