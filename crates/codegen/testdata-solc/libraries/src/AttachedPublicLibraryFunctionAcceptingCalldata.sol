// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library DPublicCalldata {
    function f(bytes calldata _x) public pure returns (bytes1) {
        return _x[0];
    }
    function g(bytes memory _x) public pure returns (bytes1) {
        return _x[0];
    }
}

contract AttachedPublicLibraryFunctionAcceptingCalldata {
    using DPublicCalldata for bytes;
    function f(bytes calldata _x) public pure returns (bytes1, bytes1) {
        return (_x.f(), _x.g());
    }
}
