// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LSelector {
    function selector(function(uint256) internal pure returns (uint256) f, uint256 x) internal pure returns (uint256) {
        return f(x) * 2;
    }
}

contract InternalLibraryFunctionAttachedToInternalFunctionTypeNamedSelector {
    using LSelector for function(uint256) internal pure returns (uint256);

    function identity(uint256 x) internal pure returns (uint256) {
        return x;
    }

    function run(uint256 value) public returns (uint256) {
        return identity.selector(value);
    }
}
