// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TransientStateVariableCleanupTstore {
    uint8 transient x;
    function f() public returns (uint256 r) {
        assembly {
            tstore(x.slot, 0xFFFF)
        }
        return x;
    }
}
