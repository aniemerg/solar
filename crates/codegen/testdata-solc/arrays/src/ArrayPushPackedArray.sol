// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayPushPackedArray {
    uint80[] x;

    function runTest() public returns (uint80, uint80, uint80, uint80) {
        x.push(1);
        x.push(2);
        x.push(3);
        x.push(4);
        x.push(5);
        x.pop();
        return (x[0], x[1], x[2], x[3]);
    }
}
