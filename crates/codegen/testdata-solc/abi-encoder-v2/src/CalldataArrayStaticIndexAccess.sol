// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArrayStaticIndexAccess {
    function f(uint256[3] calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function g(uint256[3][2] calldata s, uint256 which) external view returns (bytes memory) {
        return this.f(s[which]);
    }
    function h(uint8[3] calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function i(uint8[3][2] calldata s, uint256 which) external view returns (bytes memory) {
        return this.h(s[which]);
    }
}
