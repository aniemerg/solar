// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KeccakMultipleString {
    function foo() public pure returns (bytes32 d) {
        d = keccak256("foo");
    }

    function bar(uint256 a, uint16 b) public pure returns (bytes32 d) {
        d = keccak256(abi.encodePacked(a, b, uint8(145), "foo"));
    }
}
