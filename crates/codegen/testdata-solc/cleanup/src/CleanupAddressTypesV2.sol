// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Checks that address types are properly cleaned before they are compared.
contract CleanupAddressTypesV2 {
    function f(address a) public pure returns (uint256) {
        if (a != 0x1234567890123456789012345678901234567890) return 1;
        return 0;
    }

    function g(address payable a) public pure returns (uint256) {
        if (a != 0x1234567890123456789012345678901234567890) return 1;
        return 0;
    }
}
