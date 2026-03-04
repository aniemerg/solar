// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ecrecover {
    function a(bytes32 h, uint8 v, bytes32 r, bytes32 s) public returns (address addr) {
        return ecrecover(h, v, r, s);
    }
}
