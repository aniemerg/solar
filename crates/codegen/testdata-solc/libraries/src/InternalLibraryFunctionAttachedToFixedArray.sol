// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LFixedArray {
    function at(uint256[2] memory a, uint256 i) internal pure returns (uint256) {
        return a[i];
    }
}

contract InternalLibraryFunctionAttachedToFixedArray {
    using LFixedArray for uint256[2];

    function secondItem() public returns (uint256) {
        uint256[2] memory input;
        input[0] = 0x11;
        input[1] = 0x22;

        return input.at(1);
    }
}
