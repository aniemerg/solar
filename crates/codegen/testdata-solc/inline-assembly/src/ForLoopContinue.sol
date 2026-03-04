// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForLoopContinue {
    function f() public returns (uint k) {
        assembly {
            for {let i := 0} lt(i, 10) { i := add(i, 1) }
            {
                if eq(mod(i, 2), 0) { continue }
                k := add(k, 1)
            }
        }
    }
}
