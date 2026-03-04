// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DirtyCalldataBytes {
    function f(bytes calldata b) public pure returns (bool correct) {
        bytes1 a = b[3];
        uint r;
        assembly {
            r := a
        }
        correct = r == (0x64 << 248);
    }
}
