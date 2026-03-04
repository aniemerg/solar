// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesConcatAsArgument {
    function f(bytes memory a, bytes memory b) public returns (bytes32) {
        return keccak256(bytes.concat(a, b));
    }

    function h(bytes memory a) internal returns (uint256) {
        return a.length;
    }

    function g(bytes memory a, bytes memory b) public returns (uint256) {
        return h(bytes.concat(a, b));
    }
}
