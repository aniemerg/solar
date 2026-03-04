// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayPop {
    uint256[] data;

    function runTest() public returns (uint256 x, uint256 l) {
        data.push(7);
        data.push(3);
        x = data.length;
        data.pop();
        x = data.length;
        data.pop();
        l = data.length;
    }
}
