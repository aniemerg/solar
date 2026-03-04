// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataNestedArrayStaticReencode {
    function f(uint[3][] calldata a) public {
        abi.encode(a);
    }
    function fFixed(uint[][3] calldata a) public {
        abi.encode(a);
    }
    function fSquare(uint[2][2] calldata a) public {
        abi.encode(a);
    }
}
