// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct T {
    bytes x;
    uint[3] y;
}

contract AbiEncoderV2HeadOverflow {
    function f(bool a, T calldata b, bytes32[2] calldata c)
        public
        returns (bool, T memory, bytes32[2] memory)
    {
        T memory bm = T(b.x, b.y);
        bytes32[2] memory cm = [c[0], c[1]];
        return (a, bm, cm);
    }
}
