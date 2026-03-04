// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PassFunctionTypesInternally {
    function f(uint256 x) public pure returns (uint256) {
        return eval(g, x);
    }

    function eval(function(uint) internal pure returns (uint) x, uint a) internal pure returns (uint) {
        return x(a);
    }

    function g(uint256 x) public pure returns (uint256) {
        return x + 1;
    }
}
