// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TernaryContractInternalFunction {
    function f() internal pure returns (uint256) { return 1; }
    function g() internal pure returns (uint256) { return 2; }
    function run(bool b) public pure returns (uint256) {
        return (b ? TernaryContractInternalFunction.f : TernaryContractInternalFunction.g)();
    }
}
