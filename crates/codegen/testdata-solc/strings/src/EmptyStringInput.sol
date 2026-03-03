// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmptyStringInput {
    function f() public pure returns (string memory) {
        return "";
    }

    function g(string calldata msg1) public pure returns (string memory) {
        return msg1;
    }

    function h(string calldata msg1, uint256 v) public pure returns (string memory, uint256) {
        return (msg1, v);
    }

    function i(string calldata msg1, uint256 v, string calldata msg2) public pure returns (string memory, string memory, uint256) {
        return (msg1, msg2, v);
    }

    function j(string calldata msg1, uint256 v) public pure returns (string memory, string memory, uint256) {
        return (msg1, "", v);
    }
}
