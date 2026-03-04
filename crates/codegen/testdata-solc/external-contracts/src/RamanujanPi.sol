// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PRBMathSD59x18.sol";

function factorial(uint n) pure returns (uint ret) {
    ret = 1;
    for (; n > 1; --n)
        ret *= n;
}

contract RamanujanPi {
    using PRBMathSD59x18 for int256;

    function prb_scale(uint n) internal pure returns (int256 ret) {
        // Scale to SD59x18
        ret = int256(n * 10e17);
    }

    // This dumb implementation of Ramanujan series calculates 1/pi
    function prb_pi() external pure returns (int256 ret) {
        uint n = 6; // More than 6 iterations results in failure
        for (uint k = 0; k < n; k++) {
            int256 a = prb_scale(factorial(4 * k)).div(prb_scale(factorial(k)).pow(4));
            int256 b = (prb_scale(25390).mul(prb_scale(k)) + prb_scale(1103)).div(prb_scale(396).pow(4 * k));
            ret += a.mul(b);
        }
        ret = ret.mul(prb_scale(2).sqrt().mul(prb_scale(2)).div(prb_scale(99).pow(2)));
        ret = prb_scale(1).div(ret);
    }
}
