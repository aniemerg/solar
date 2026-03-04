// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlockhashShadowResolution {
    function blockhash(uint256 blockNumber) public pure returns (bytes32) {
        bytes32 x;
        return x;
    }

    function f() public pure returns (bytes32) {
        return blockhash(3);
    }
}
