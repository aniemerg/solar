// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataBytesByte32Arrays {
    function f(bool a, bytes calldata b, bytes32[2] calldata c)
        public
        returns (bool, bytes memory, bytes32[2] memory)
    {
        bytes32[2] memory cm = [c[0], c[1]];
        return (a, b, cm);
    }
}
