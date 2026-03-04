// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CleanupUintX {
    function ggg8(uint8 x) external pure returns (uint256) {
        return x;
    }
    function gg16(uint16 x) external pure returns (uint256) {
        return x;
    }
    function gg32(uint32 x) external pure returns (uint256) {
        return x;
    }
    function gg64(uint64 x) external pure returns (uint256) {
        return x;
    }
    function g128(uint128 x) external pure returns (uint256) {
        return x;
    }
    function f8(uint256 a) external view returns (uint256) {
        uint8 x = 0;
        assembly { x := a }
        return this.ggg8(x);
    }
    function f16(uint256 a) external view returns (uint256) {
        uint16 x = 0;
        assembly { x := a }
        return this.gg16(x);
    }
    function f32(uint256 a) external view returns (uint256) {
        uint32 x = 0;
        assembly { x := a }
        return this.gg32(x);
    }
    function f64(uint256 a) external view returns (uint256) {
        uint64 x = 0;
        assembly { x := a }
        return this.gg64(x);
    }
    function f128(uint256 a) external view returns (uint256) {
        uint128 x = 0;
        assembly { x := a }
        return this.g128(x);
    }
}
