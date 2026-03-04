// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StateVariableLocalVariableMixture {
    uint256 x = 1;
    uint256 y = 2;

    function a() public returns (uint256 x) {
        x = StateVariableLocalVariableMixture.y;
    }
}
