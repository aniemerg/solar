// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RequireErrorEvaluationOrder2 {
    uint256 y;

    error E(uint256);

    function g(bool x) internal returns (bool) {
        y = 42;
        return x;
    }

    function h() internal view returns (uint256) {
        return y;
    }

    function f(bool c) public {
        require(g(c), E(h()));
    }
}
