// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArrayRead {
    function f(uint[2][] calldata x) public returns (uint o, uint l, uint s) {
        assembly { l := x.length o := x.offset }
        uint[2] calldata t = x[1];
        // statically-sized arrays only use one slot, so we read directly.
        assembly { s := t }
    }
}
