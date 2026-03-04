// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CleanupBytesX {
    function gg1(bytes1 x) external pure returns (bytes32) {
        return x;
    }
    function f1(bytes32 a) external view returns (bytes32) {
        bytes1 x;
        assembly { x := a }
        return this.gg1(x);
    }
    function gg2(bytes2 x) external pure returns (bytes32) {
        return x;
    }
    function f2(bytes32 a) external view returns (bytes32) {
        bytes2 x;
        assembly { x := a }
        return this.gg2(x);
    }
    function gg4(bytes4 x) external pure returns (bytes32) {
        return x;
    }
    function f4(bytes32 a) external view returns (bytes32) {
        bytes4 x;
        assembly { x := a }
        return this.gg4(x);
    }
    function gg8(bytes8 x) external pure returns (bytes32) {
        return x;
    }
    function f8(bytes32 a) external view returns (bytes32) {
        bytes8 x;
        assembly { x := a }
        return this.gg8(x);
    }
    function g16(bytes16 x) external pure returns (bytes32) {
        return x;
    }
    function f16(bytes32 a) external view returns (bytes32) {
        bytes16 x;
        assembly { x := a }
        return this.g16(x);
    }
}
