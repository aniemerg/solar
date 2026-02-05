// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EscapeLiteral {
    function f() public pure returns (uint256, bytes1, bytes1) {
        bytes memory encoded = abi.encodePacked("\\\\");
        return (encoded.length, encoded[0], encoded[1]);
    }
}
