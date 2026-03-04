// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ByteArrayPop {
    bytes data;

    function runTest() public returns (uint256 x, uint256 y, uint256 l) {
        data.push(0x07);
        data.push(0x03);
        x = data.length;
        data.pop();
        data.pop();
        data.push(0x02);
        y = data.length;
        l = data.length;
    }
}
