// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CleanupIntX {
    function ggg8(int8 x) external pure returns (int256) {
        return x;
    }
    function gg16(int16 x) external pure returns (int256) {
        return x;
    }
    function gg32(int32 x) external pure returns (int256) {
        return x;
    }
    function gg64(int64 x) external pure returns (int256) {
        return x;
    }
    function g128(int128 x) external pure returns (int256) {
        return x;
    }
    function f8(int256 a) external view returns (int256) {
        int8 x = 0;
        assembly { x := a }
        return this.ggg8(x);
    }
    function f16(int256 a) external view returns (int256) {
        int16 x = 0;
        assembly { x := a }
        return this.gg16(x);
    }
    function f32(int256 a) external view returns (int256) {
        int32 x = 0;
        assembly { x := a }
        return this.gg32(x);
    }
    function f64(int256 a) external view returns (int256) {
        int64 x = 0;
        assembly { x := a }
        return this.gg64(x);
    }
    function f128(int256 a) external view returns (int256) {
        int128 x = 0;
        assembly { x := a }
        return this.g128(x);
    }
}
