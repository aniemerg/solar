// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LDynArray {
    function reverse(uint256[] calldata _a) internal pure returns (uint256, uint256) {
        return (_a[1], _a[0]);
    }
}

contract CalldataAttachedToDynamicArrayOrSlice {
    using LDynArray for *;

    function testArray(uint256, uint256[] calldata _a, uint256) external pure returns (uint256, uint256) {
        return _a.reverse();
    }

    function testSlice(uint256, uint256[] calldata _a, uint256) external pure returns (uint256, uint256) {
        return _a[:].reverse();
    }
}
