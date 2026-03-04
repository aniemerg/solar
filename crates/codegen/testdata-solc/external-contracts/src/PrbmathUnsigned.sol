// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PRBMathUD60x18.sol";

contract PrbmathUnsigned {
    using PRBMathUD60x18 for uint256;

    function div(uint256 x, uint256 y) external pure returns (uint256 ret) {
        ret = x.div(y);
    }
    function exp(uint256 x) external pure returns (uint256 ret) {
        ret = x.exp();
    }
    function exp2(uint256 x) external pure returns (uint256 ret) {
        ret = x.exp2();
    }
    function gm(uint256 x, uint256 y) external pure returns (uint256 ret) {
        ret = x.gm(y);
    }
    function log10(uint256 x) external pure returns (uint256 ret) {
        ret = x.log10();
    }
    function log2(uint256 x) external pure returns (uint256 ret) {
        ret = x.log2();
    }
    function mul(uint256 x, uint256 y) external pure returns (uint256 ret) {
        ret = x.mul(y);
    }
    function pow(uint256 x, uint256 y) external pure returns (uint256 ret) {
        ret = x.pow(y);
    }
    function sqrt(uint256 x) external pure returns (uint256 ret) {
        ret = x.sqrt();
    }
    function benchmark(uint256 x) external pure returns (uint256 ret, uint256 z1, uint256 z2) {
        uint256 y = x.mul(3).ceil();
        uint256 z = y.div(x);
        for (uint i = 0; i < 10; i++)
            z = z.sqrt();
        ret = z;

        // Check precision
        z1 = z.ceil();
        z2 = z.sqrt().pow(2).ceil();
        assert(z1 == z2);
    }
}
