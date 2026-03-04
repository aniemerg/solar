// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LStubInternal {
    function f(uint256 v) internal returns (uint256) { return v * v; }
}

contract StubInternal {
    function g(uint256 v) external returns (uint256) {
        return LStubInternal.f(v);
    }
}
