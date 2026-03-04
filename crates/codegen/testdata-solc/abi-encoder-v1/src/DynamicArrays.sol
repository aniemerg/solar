// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DynamicArrays {
    function f(uint a, uint16[] memory b, uint c)
            public pure returns (uint, uint, uint) {
        return (b.length, b[a], c);
    }
}
