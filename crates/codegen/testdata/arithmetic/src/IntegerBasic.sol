// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntegerBasic {
    function basic() public pure returns (bool) {
        uint256 uintMin = type(uint256).min;
        require(uintMin == 0);

        uint256 uintMax = type(uint256).max;
        require(uintMax == 2**256 - 1);
        require(
            uintMax == 115792089237316195423570985008687907853269984665640564039457584007913129639935
        );

        int256 intMin = type(int256).min;
        require(intMin == -2**255);
        require(
            intMin == -57896044618658097711785492504343953926634992332820282019728792003956564819968
        );

        int256 intMax = type(int256).max;
        require(intMax == 2**255 - 1);
        require(
            intMax == 57896044618658097711785492504343953926634992332820282019728792003956564819967
        );

        return true;
    }
}
