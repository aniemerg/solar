// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DirtyCalldataDynamicArray {
    function f(int16[] calldata a) external pure returns (bool correct) {
        uint32 x = uint32(uint16(a[1]));
        uint r;
        assembly {
            r := x
        }
        correct = r == 0x7fff;
    }
}
