// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Strings {
    function fixedBytesHex() public pure returns(bytes32 ret) {
        return hex"aabb00ff";
    }
    function fixedBytes() public pure returns(bytes32 ret) {
        return "abc\x00\xff__";
    }
    function pipeThrough(bytes2 small, bool one) public pure returns(bytes16 large, bool oneRet) {
        oneRet = one;
        large = small;
    }
}
