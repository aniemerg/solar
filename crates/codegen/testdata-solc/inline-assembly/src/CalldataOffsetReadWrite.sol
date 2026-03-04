// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataOffsetReadWrite {
    function f(uint, bytes calldata x, uint) public returns (uint r, uint v) {
        assembly {
            x.offset := 8
            x.length := 20
        }
        assembly {
            r := x.offset
            v := x.length
        }
    }
}
