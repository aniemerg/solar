// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayStorageBoundaryCheck {
    uint256[] storageArray;

    function checkBoundaryCheck(uint256 len, uint256 access) public returns (uint256) {
        while (storageArray.length < len) storageArray.push();
        while (storageArray.length > len) storageArray.pop();
        return storageArray[access];
    }
}
