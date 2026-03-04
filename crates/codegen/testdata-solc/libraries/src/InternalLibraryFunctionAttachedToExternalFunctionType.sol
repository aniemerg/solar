// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LExtFn {
    // NOTE: External function takes up two stack slots
    function double(function(uint256) external pure returns (uint256) f, uint256 x) internal pure returns (uint256) {
        return f(x) * 2;
    }
}

contract InternalLibraryFunctionAttachedToExternalFunctionType {
    using LExtFn for function(uint256) external pure returns (uint256);

    function identity(uint256 x) external pure returns (uint256) {
        return x;
    }

    function run(uint256 value) public returns (uint256) {
        return this.identity.double(value);
    }
}
