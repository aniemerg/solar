// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../src/TransientStateAddressVariableMembers.sol";

contract TransientStateAddressVariableMembersTest {
    function test_TransientStateAddressVariableMembers_f() public {
        TransientStateAddressVariableMembers c = new TransientStateAddressVariableMembers();
        // f() stores msg.sender in transient a, returns a.balance
        // The caller is this test contract; its balance may be 0
        uint bal = c.f();
        assert(bal == address(this).balance);
    }

    function test_TransientStateAddressVariableMembers_g() public {
        TransientStateAddressVariableMembers c = new TransientStateAddressVariableMembers();
        // g() reads a.balance; in a fresh tx, a is address(0), balance is 0
        assert(c.g() == 0);
    }
}
