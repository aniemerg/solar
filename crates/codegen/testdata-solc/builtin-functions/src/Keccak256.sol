// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Keccak256 {
    function f(int256 input) public pure returns (bytes32 sha256hash) {
        return keccak256(abi.encodePacked(bytes32(uint256(input))));
    }
}
