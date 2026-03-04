// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library D {
    function f(bytes calldata _x) internal pure returns (bytes1) {
        return _x[0];
    }
    function g(bytes memory _x) internal pure returns (bytes1) {
        return _x[0];
    }
}

contract AttachedInternalLibraryFunctionAcceptingCalldata {
    using D for bytes;
    function f(bytes calldata _x) public pure returns (bytes1, bytes1) {
        return (_x.f(), _x.g());
    }
}
