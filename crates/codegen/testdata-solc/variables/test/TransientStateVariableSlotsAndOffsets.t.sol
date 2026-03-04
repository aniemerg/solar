// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../src/TransientStateVariableSlotsAndOffsets.sol";

contract TransientStateVariableSlotsAndOffsetsTest {
    function test_TransientStateVariableSlotsAndOffsets() public {
        TransientStateVariableSlotsAndOffsets c = new TransientStateVariableSlotsAndOffsets();
        (uint128 xv, uint64 yv, uint64 wv, uint256 zv) = c.f();
        assert(xv == 1);
        assert(yv == 2);
        assert(wv == 3);
        assert(zv == 4);
    }
}
