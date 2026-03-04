// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {}

contract AssignTypeInfo {
    bytes constant creationCode = type(A).creationCode;
    bytes constant runtimeCode = type(A).runtimeCode;

    function nonEmptyCode() public pure returns (bool) {
        return creationCode.length > 0 && runtimeCode.length > 0;
    }
}
