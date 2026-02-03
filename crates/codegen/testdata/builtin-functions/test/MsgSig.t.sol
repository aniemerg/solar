// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MsgSig.sol";

contract MsgSigTest {
    function test_MsgSig() public {
        MsgSig c = new MsgSig();
        bytes4 sig = c.foo(0);
        assert(sig == bytes4(keccak256("foo(uint256)")));
    }
}
