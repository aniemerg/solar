// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataStringArray {
    function f(string[] calldata a)
        external
        pure
        returns (uint256, uint256, uint256, string memory)
    {
        string memory s1 = a[0];
        bytes memory m1 = bytes(s1);
        return (a.length, m1.length, uint8(m1[0]), s1);
    }
}
