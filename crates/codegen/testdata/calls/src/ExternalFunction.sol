// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExternalFunction {
    function f(uint256 a) public pure returns (uint256) {
        return a;
    }

    function test(uint256 a, uint256 b) external pure returns (uint256 r_a, uint256 r_b) {
        r_a = f(a + 7);
        r_b = b;
    }
}
