// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TypeConversionCleanup {
    function test() public pure returns (uint ret) {
        return uint(uint160(address(uint160(uint128(type(uint200).max)))));
    }
}
