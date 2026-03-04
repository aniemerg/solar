// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecodeSlice {
    function f(uint256 a, uint256 b) external returns (uint256 c, uint256 d, uint256 e, uint256 g) {
        (c, d) = abi.decode(msg.data[4:], (uint256, uint256));
        e = abi.decode(msg.data[4 : 4 + 32], (uint256));
        g = abi.decode(msg.data[4 + 32 : 4 + 32 + 32], (uint256));
    }
}
