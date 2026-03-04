// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MsgDataToStructMemberCopy.sol";

contract MsgDataToStructMemberCopyTest {
    MsgDataToStructMemberCopy c;

    function setUp() public {
        c = new MsgDataToStructMemberCopy();
    }

    function test_MsgDataToStructMemberCopy() public {
        // f() - no args, msg.data is 4-byte selector only
        MsgDataSt0 memory r1 = c.f();
        assert(r1.el0.length == 4);

        // g() - no args, msg.data is 4-byte selector only
        MsgDataSt0 memory r2 = c.g();
        assert(r2.el0.length == 4);

        // f() and g() should capture their own selectors
        assert(keccak256(r1.el0) != keccak256(r2.el0));

        // large(uint256,uint256,uint256,uint256) - selector + 4 * 32 bytes = 132 bytes
        MsgDataSt0 memory r3 = c.large(1, 2, 3, 4);
        assert(r3.el0.length == 132);

        MsgDataSt0 memory r4 = c.another_large(1, 2, 3, 4);
        assert(r4.el0.length == 132);
    }
}
