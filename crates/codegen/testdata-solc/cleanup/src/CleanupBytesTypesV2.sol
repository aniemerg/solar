// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Checks that bytesXX types are properly cleaned before they are compared.
contract CleanupBytesTypesV2 {
    function f(bytes2 a, uint16 x) public pure returns (uint256) {
        if (a != "ab") return 1;
        if (x != 0x0102) return 2;
        if (bytes3(uint24(x)) != 0x000102) return 3;
        return 0;
    }
}
