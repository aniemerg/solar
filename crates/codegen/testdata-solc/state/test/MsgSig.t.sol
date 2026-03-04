// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MsgSig.sol";

contract MsgSigTest {
    function test_MsgSig() public {
        MsgSig c = new MsgSig();
        // msg.sig returns the function selector of the called function
        assert(c.f() == MsgSig.f.selector);
        assert(c.g() == MsgSig.g.selector);
        // The two selectors should be different
        assert(c.f() != c.g());
    }
}
