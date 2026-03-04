// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library DPubReturn {
    function f(bytes calldata _x) public pure returns (bytes calldata) {
        return _x;
    }
    function g(bytes calldata _x) public pure returns (bytes memory) {
        return _x;
    }
}

contract AttachedPublicLibraryFunctionReturningCalldata {
    using DPubReturn for bytes;
    function f(bytes calldata _x) public pure returns (bytes1, bytes1) {
        return (_x.f()[0], _x.g()[0]);
    }
}
