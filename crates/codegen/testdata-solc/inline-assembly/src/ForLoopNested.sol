// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForLoopNested {
    function f(uint x) public returns (uint i) {
        assembly {
            for {} lt(i, 10) { i := add(i, 1) }
            {
                if eq(x, 0) { i := 2 break }
                for {} lt(x, 3) { i := 17 x := 9 } {
                    if eq(x, 1) { continue }
                    if eq(x, 2) { break }
                }
                if eq(x, 4) { i := 90 }
            }
        }
    }
}
