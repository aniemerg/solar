// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MsgSigInternal.sol";

contract MsgSigInternalTest {
    function test_MsgSigInternal() public {
        MsgSigInternal c = new MsgSigInternal();
        bytes4 sig = c.foo(0);
        assert(sig == bytes4(keccak256("foo(uint256)")));
    }
}
