// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CollatzCalls {
    function run(uint256 x) public pure returns (uint256 y) {
        while ((y = x) > 1) {
            if (x % 2 == 0) x = evenStep(x);
            else x = oddStep(x);
        }
    }

    function evenStep(uint256 x) public pure returns (uint256 y) {
        return x / 2;
    }

    function oddStep(uint256 x) public pure returns (uint256 y) {
        return 3 * x + 1;
    }
}
