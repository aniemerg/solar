// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodehashAssembly {
    function f() public returns (bytes32 ret) {
        assembly {
            ret := extcodehash(0)
        }
    }

    function g() public returns (bytes32 ret) {
        assembly {
            ret := extcodehash(1)
        }
    }

    function h() public returns (bool ret) {
        assembly {
            ret := iszero(iszero(extcodehash(address())))
        }
    }
}
