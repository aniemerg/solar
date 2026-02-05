// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExponentiationLiteralBase {
    function f(uint256 x) public pure returns (uint256, int256) {
        unchecked {
            uint256 a = 2 ** x;
            int256 b = -2 ** x;
            return (a, b);
        }
    }
}
