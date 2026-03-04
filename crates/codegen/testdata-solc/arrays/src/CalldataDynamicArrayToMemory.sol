// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract CalldataDynamicArrayToMemory {
    function f(uint256[][] calldata a)
        external
        returns (uint256, uint256[] memory)
    {
        uint256[] memory m = a[0];
        return (a.length, m);
    }
}
