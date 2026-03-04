// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReturnDynamicTypesCrossCallSimple {
    function dyn() public returns (bytes memory) {
        return "1234567890123456789012345678901234567890";
    }
    function f() public returns (bytes memory) {
        return this.dyn();
    }
}
