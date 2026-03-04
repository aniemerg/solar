// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConstantVarAsArrayLength {
    uint256 constant LEN = 3;
    uint256[LEN] public a;

    constructor(uint256[LEN] memory _a) {
        a = _a;
    }
}
