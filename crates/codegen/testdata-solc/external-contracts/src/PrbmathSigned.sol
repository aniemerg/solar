// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PRBMathSD59x18.sol";

contract PrbmathSigned {
    using PRBMathSD59x18 for int256;

    function div(int256 x, int256 y) external pure returns (int256 ret) {
        ret = x.div(y);
    }
    function exp(int256 x) external pure returns (int256 ret) {
        ret = x.exp();
    }
    function exp2(int256 x) external pure returns (int256 ret) {
        ret = x.exp2();
    }
    function gm(int256 x, int256 y) external pure returns (int256 ret) {
        ret = x.gm(y);
    }
    function log10(int256 x) external pure returns (int256 ret) {
        ret = x.log10();
    }
    function log2(int256 x) external pure returns (int256 ret) {
        ret = x.log2();
    }
    function mul(int256 x, int256 y) external pure returns (int256 ret) {
        ret = x.mul(y);
    }
    function pow(int256 x, uint256 y) external pure returns (int256 ret) {
        ret = x.pow(y);
    }
    function sqrt(int256 x) external pure returns (int256 ret) {
        ret = x.sqrt();
    }
    function benchmark(int256 x) external pure returns (int256 ret, int256 z1, int256 z2) {
        int256 y = x.mul(3).ceil();
        int256 z = y.div(x);
        for (uint i = 0; i < 10; i++)
            z = z.sqrt();
        ret = z;

        // Check precision
        z1 = z.ceil();
        z2 = z.sqrt().pow(2).ceil();
        assert(z1 == z2);
    }
}
