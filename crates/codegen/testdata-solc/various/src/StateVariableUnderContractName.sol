// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StateVariableUnderContractName {
    uint256 stateVar = 42;

    function getStateVar() public view returns (uint256 stateVar) {
        stateVar = StateVariableUnderContractName.stateVar;
    }
}
