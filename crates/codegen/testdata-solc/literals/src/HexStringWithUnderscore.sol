// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HexStringWithUnderscore {
    function f() public pure returns (bytes memory) {
        return hex"12_34_5678_9A";
    }
}
