// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultipleReturnValues {
    function run(bool x1, uint256 x2) public pure returns (uint256 y1, bool y2, uint256 y3) {
        y1 = x2;
        y2 = x1;
    }
}
