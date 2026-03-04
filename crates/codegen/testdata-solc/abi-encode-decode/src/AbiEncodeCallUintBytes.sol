// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AbiEncodeCallUintBytes {
    function removeSignature(bytes calldata x) external pure returns (bytes memory) {
        return x[4:];
    }
    function g(bytes2, bytes2, bytes2) public {}
    function h(uint16, uint16) public {}
    function f() public returns (bytes memory) {
        uint16 x = 0x1234;
        return this.removeSignature(abi.encodeCall(this.g, (0x1234, "ab", bytes2(x))));
    }
    function f2() public returns (bytes memory) {
        bytes2 x = 0x1234;
        return this.removeSignature(abi.encodeCall(this.h, (0x1234, uint16(x))));
    }
}
