// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../src/TransientStateVariableSlotInlineAssembly.sol";

contract TransientStateVariableSlotInlineAssemblyTest {
    function test_TransientStateVariableSlotInlineAssembly() public {
        TransientStateVariableSlotInlineAssembly c = new TransientStateVariableSlotInlineAssembly();
        // x is uint256 transient, first transient slot: slot=0, offset=0
        (uint256 xs, uint256 xo) = c.f();
        assert(xs == 0);
        assert(xo == 0);
        // w is int8 transient, packed after x which is full slot: slot=1, offset=0
        (uint256 ws, uint256 wo) = c.g();
        assert(ws == 1);
        assert(wo == 0);
        // a is address transient (20 bytes), packed in same slot as w (int8, 1 byte): slot=1, offset=1
        (uint256 as_, uint256 ao) = c.h();
        assert(as_ == 1);
        assert(ao == 1);
    }
}
