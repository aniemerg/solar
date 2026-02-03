// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KeccakMultiple {
    function foo(uint256 a, uint256 b, uint256 c) public pure returns (bytes32 d) {
        d = keccak256(abi.encodePacked(a, b, c));
    }
}
