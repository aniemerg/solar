// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InvalidAbiDecodingMemory {
    function dyn(uint ptr, uint start, uint x) public pure returns (bytes memory a) {
        assembly {
            mstore(0, start)
            mstore(start, add(start, 1))
            return(ptr, x)
        }
    }
    function f(uint ptr, uint start, uint x) public returns (bool) {
        this.dyn(ptr, start, x);
        return true;
    }
}
