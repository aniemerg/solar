// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataArrayLength {
    function len1(uint256[] calldata x) external pure returns (uint256) {
        return x.length;
    }

    function len2(uint256[][] calldata x) external pure returns (uint256 l1, uint256 l2, uint256 l3) {
        l1 = x.length;
        if (l1 > 0) l2 = x[0].length;
        if (l1 > 1) l3 = x[1].length;
    }

    function lenFixed(uint256[2] calldata x) external pure returns (uint256) {
        return x.length;
    }
}
