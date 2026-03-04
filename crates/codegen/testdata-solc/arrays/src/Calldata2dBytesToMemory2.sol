// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract Calldata2dBytesToMemory2 {
    function g(bytes[2] memory m) internal {
        assert(m[0].length > 1);
        assert(m[1].length > 1);
        assert(m[0][0] == m[1][0]);
        assert(m[0][1] == m[1][1]);
    }
    function f(bytes[2] calldata c) external {
        g(c);
    }
}
