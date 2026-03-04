// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForLoopBreak {
    function f() public returns (uint i) {
        assembly {
            for {} lt(i, 10) { i := add(i, 1) }
            {
                if eq(i, 6) { break }
                i := add(i, 1)
            }
        }
    }
}
