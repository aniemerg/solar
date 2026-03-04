// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExpCleanupNonzeroBase {
    function f() public pure returns (uint8 x) {
        unchecked {
            uint16 y = 0x166;
            return uint8(y)**uint8(uint8(2)**uint8(8));
        }
    }
}
