// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library L {
    function f() internal pure returns (uint256) { return 1; }
}

contract TernaryContractLibraryInternalFunction {
    function g() internal pure returns (uint256) { return 2; }
    function run(bool b) public pure returns (uint256) {
        return (b ? L.f : TernaryContractLibraryInternalFunction.g)();
    }
}
