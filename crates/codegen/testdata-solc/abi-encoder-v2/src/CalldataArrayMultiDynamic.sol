// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArrayMultiDynamic {
    function f(uint256[][] calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function g(uint256[][] calldata s) external view returns (bytes memory) {
        return this.f(s);
    }
    function h(uint8[][] calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function i(uint8[][] calldata s) external view returns (bytes memory) {
        return this.h(s);
    }
    function j(bytes[] calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function k(bytes[] calldata s) external view returns (bytes memory) {
        return this.j(s);
    }
}
