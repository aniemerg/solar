// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RequireErrorEvaluationOrder1 {
    error E(uint256);

    function r() internal returns (uint256) {
        assembly {
            mstore(0, 7)
            return(0, 32)
        }
        return 42;
    }

    function f() public returns (uint256) {
        require(false, E(r()));
        return 42;
    }

    function g() public returns (uint256) {
        require(true, E(r()));
        return 42;
    }
}
