// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LAdd {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }
}

contract InternalLibraryFunctionAttachedToInteger {
    using LAdd for uint256;

    function foo(uint256 a, uint256 b) public pure returns (uint256) {
        return a.add(b);
    }
}
