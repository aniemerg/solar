// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExpCleanup {
    function f() public pure returns (uint x) {
        unchecked {
            uint8 y = uint8(2)**uint8(8);
            return 0**y;
        }
    }
}
