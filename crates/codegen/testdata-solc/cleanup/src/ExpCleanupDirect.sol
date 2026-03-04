// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExpCleanupDirect {
    function f() public pure returns (uint8 x) {
        unchecked {
            return uint8(0)**uint8(uint8(2)**uint8(8));
        }
    }
}
