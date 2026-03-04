// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataOffsetRead {
    function f(bytes calldata x) public returns (uint r) {
        assembly { r := x.offset }
    }

    function f2(uint, bytes calldata x, uint) public returns (uint r, uint v) {
        assembly {
            r := x.offset
            v := x.length
        }
    }
}
