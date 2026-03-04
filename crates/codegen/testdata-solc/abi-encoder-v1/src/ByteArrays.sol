// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ByteArrays {
    function f(uint a, bytes memory b, uint c)
            public pure returns (uint, uint, bytes1, uint) {
        return (a, b.length, b[3], c);
    }

    function f_external(uint a, bytes calldata b, uint c)
            external pure returns (uint, uint, bytes1, uint) {
        return (a, b.length, b[3], c);
    }
}
