// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MsgData.sol";

contract MsgDataTest {
    function test_MsgData_f() public {
        MsgData c = new MsgData();
        // f() returns msg.data which is the 4-byte selector
        bytes memory data = c.f();
        assert(data.length == 4);
        // selector of f()
        bytes4 sel = MsgData.f.selector;
        assert(data[0] == sel[0]);
        assert(data[1] == sel[1]);
        assert(data[2] == sel[2]);
        assert(data[3] == sel[3]);
    }

    function test_MsgData_g() public {
        MsgData c = new MsgData();
        // g(uint256, bool) returns msg.data which includes selector + 2 params = 4 + 64 = 68 bytes
        bytes memory data = c.g(1234, true);
        assert(data.length == 68);
        bytes4 sel = MsgData.g.selector;
        assert(data[0] == sel[0]);
        assert(data[1] == sel[1]);
        assert(data[2] == sel[2]);
        assert(data[3] == sel[3]);
    }
}
