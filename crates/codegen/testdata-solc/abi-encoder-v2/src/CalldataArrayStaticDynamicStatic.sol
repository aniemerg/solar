// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArrayStaticDynamicStatic {
    function f(uint8[1][][1] calldata s) external pure returns (bytes memory) {
        return msg.data;
    }
    function f2(uint256[2][][2] calldata s) external pure returns (bytes memory) {
        return msg.data;
    }
    function reenc_f(uint8[1][][1] calldata s) external view returns (bytes memory) {
        return this.f(s);
    }
    function reenc_f2(uint256[2][][2] calldata s) external view returns (bytes memory) {
        return this.f2(s);
    }
    function g() external returns (bytes memory) {
        uint8[1][][1] memory m = [new uint8[1][](1)];
        m[0][0][0] = 42;
        return this.f(m);
    }
    function h() external returns (bytes memory) {
        uint8[1][][1] memory m = [new uint8[1][](1)];
        m[0][0][0] = 42;
        return this.reenc_f(m);
    }
    function i() external returns (bytes memory) {
        uint256[2][][2] memory m = [new uint256[2][](1),new uint256[2][](1)];
        m[0][0][0] = 0x00042;
        m[0][0][1] = 0x00142;
        m[1][0][0] = 0x10042;
        m[1][0][1] = 0x10142;
        return this.f2(m);
    }
    function j() external returns (bytes memory) {
        uint256[2][][2] memory m = [new uint256[2][](1),new uint256[2][](1)];
        m[0][0][0] = 0x00042;
        m[0][0][1] = 0x00142;
        m[1][0][0] = 0x10042;
        m[1][0][1] = 0x10142;
        return this.reenc_f2(m);
    }
}
