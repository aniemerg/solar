// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TernaryContractPublicFunction {
    function f() public pure returns (uint256) { return 1; }
    function g() public pure returns (uint256) { return 2; }
    function run(bool b) public pure returns (uint256) {
        return (b ? TernaryContractPublicFunction.f : TernaryContractPublicFunction.g)();
    }
}
