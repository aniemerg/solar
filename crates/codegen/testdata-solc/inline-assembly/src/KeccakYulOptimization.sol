// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KeccakYulOptimization {
    function g() public returns (uint ret) {
        uint x = type(uint).max;
        assembly {
            mstore(0x20, x)
            // both old and new optimizer should be able to evaluate this
            ret := keccak256(0x20, 16)
        }
    }

    function f() public returns (uint ret) {
        uint x = type(uint).max;
        assembly {
            mstore(0x20, x)
            // For Yul optimizer, load resolver and loop invariant code motion
            // would take the Keccak-256 outside the loop. For the old-optimizer,
            // this is not possible.
            // Net savings approximately: 20 * cost of Keccak-256 = 572
            for {let i := 0} lt(i, 20) { i := add(i, 1) } {
                ret := keccak256(0x20, 16)
            }
        }
    }
}
