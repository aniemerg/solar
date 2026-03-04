// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../src/DeleteTransientStateVariableNonZeroOffset.sol";

contract DeleteTransientStateVariableNonZeroOffsetTest {
    function test_DeleteTransientStateVariableNonZeroOffset() public {
        DeleteTransientStateVariableNonZeroOffset c = new DeleteTransientStateVariableNonZeroOffset();
        (bytes14 xVal, uint32 yVal, uint112 zVal) = c.f();
        // x and z are unchanged; y is deleted (zeroed)
        assert(xVal == 0xffffffffffffffffffffffffffff);
        assert(yVal == 0);
        assert(zVal == 0xffffffffffffffffffffffffffff);
    }
}
