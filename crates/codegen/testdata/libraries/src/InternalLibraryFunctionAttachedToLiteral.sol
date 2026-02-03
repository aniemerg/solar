// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LLiteral {
    function double(uint256 a) internal pure returns (uint256) {
        return a * 2;
    }

    function double(bytes memory a) internal pure returns (bytes memory) {
        return bytes.concat(a, a);
    }
}

contract InternalLibraryFunctionAttachedToLiteral {
    using LLiteral for *;

    function double42() public pure returns (uint256) {
        return 42.double();
    }

    function doubleABC() public pure returns (bytes memory) {
        return "abc".double();
    }
}
