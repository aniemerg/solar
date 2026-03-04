// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayMemoryAsParameter {
    function doTest(uint256 len, uint idx) public returns (uint256) {
        uint[] memory array = new uint[](len);
        uint result = receiver(array, idx);

        for (uint256 i = 0; i < array.length; i++)
            require(array[i] == i + 1);

        return result;
    }
    function receiver(uint[] memory array, uint idx) public returns (uint256) {
        for (uint256 i = 0; i < array.length; i++)
            array[i] = i + 1;

        return array[idx];
    }
}
