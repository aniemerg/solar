// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayStoragePopZeroLength {
    uint256[] storageArray;

    function popEmpty() public {
        storageArray.pop();
    }
}
