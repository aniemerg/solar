// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayPopStorageEmpty {
    uint[] data;

    function runTest() public {
        data.push(7);
        data.pop();
    }
}
