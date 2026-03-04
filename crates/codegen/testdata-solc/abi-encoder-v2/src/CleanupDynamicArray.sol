// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CleanupDynamicArray {
    function ggg(uint8[] calldata s) external pure returns (bytes memory) {
        s[0]; // only this will validate.
        return msg.data;
    }
    function f(uint256[] calldata a) external returns (bytes memory) {
        uint8[] memory m = new uint8[](a.length);
        assembly {
            calldatacopy(add(m, 0x20), 0x44, mul(calldataload(4), 0x20))
        }
        return this.ggg(m);
    }
}
