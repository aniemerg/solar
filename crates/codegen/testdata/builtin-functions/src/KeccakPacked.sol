// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KeccakPacked {
    function f(int256 _input) public pure returns (bytes32 hash) {
        uint24 b = 65536;
        uint256 c = 256;
        bytes32 input = bytes32(uint256(_input));
        return keccak256(abi.encodePacked(uint8(8), input, b, input, c));
    }
}
