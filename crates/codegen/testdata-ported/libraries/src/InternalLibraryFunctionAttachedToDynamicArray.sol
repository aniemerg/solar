// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LDynArray {
    function at(uint256[] memory a, uint256 i) internal pure returns (uint256) {
        return a[i];
    }
}

contract InternalLibraryFunctionAttachedToDynamicArray {
    using LDynArray for uint256[];

    function secondItem() public pure returns (uint256) {
        uint256[] memory input = new uint256[](2);
        input[0] = 0x11;
        input[1] = 0x22;
        return input.at(1);
    }
}
