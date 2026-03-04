// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArrayStatic {
    function f(uint256[3] calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function g(uint256[3] calldata s) external view returns (bytes memory) {
        return this.f(s);
    }
    function h(uint8[3] calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function i(uint8[3] calldata s) external view returns (bytes memory) {
        return this.h(s);
    }
}
