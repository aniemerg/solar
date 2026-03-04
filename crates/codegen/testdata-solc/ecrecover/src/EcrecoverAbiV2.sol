// SPDX-License-Identifier: MIT
// pragma abicoder v2 is the default in Solidity 0.8.x
pragma solidity ^0.8.0;

contract EcrecoverAbiV2 {
    function a(bytes32 h, uint8 v, bytes32 r, bytes32 s) public returns (address addr) {
        return ecrecover(h, v, r, s);
    }
}
