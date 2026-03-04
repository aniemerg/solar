// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MsgValue.sol";

contract MsgValueTest {
    function test_MsgValue_NoValue() public {
        MsgValue c = new MsgValue();
        assert(c.f() == 0);
    }

    function test_MsgValue_WithValue() public {
        MsgValue c = new MsgValue();
        // Send 12 ether and check msg.value
        uint result = c.f{value: 12 ether}();
        assert(result == 12 ether);
    }

    receive() external payable {}
}
