// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GasleftShadowResolution {
    function gasleft() public returns (uint256) {
        return 0;
    }

    function f() public returns (uint256) {
        return gasleft();
    }
}
