// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LStaticArray {
    function reverse(uint256[2] calldata _a) internal pure returns (uint256, uint256) {
        return (_a[1], _a[0]);
    }
}

contract CalldataAttachedToStaticArray {
    using LStaticArray for uint256[2];

    function test(uint256, uint256[2] calldata _a, uint256) external pure returns (uint256, uint256) {
        return _a.reverse();
    }
}
