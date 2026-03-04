// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LStub {
    function f(uint256 v) external returns (uint256) { return v * v; }
}

contract Stub {
    function g(uint256 v) external returns (uint256) {
        return LStub.f(v);
    }
}
