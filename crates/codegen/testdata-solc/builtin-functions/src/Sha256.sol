// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Sha256 {
    function f(int256 input) public pure returns (bytes32 sha256hash) {
        return sha256(abi.encodePacked(bytes32(uint256(input))));
    }
}
