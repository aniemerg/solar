// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodebalanceAssembly {
    constructor() payable {}

    function f() public returns (uint256 ret) {
        assembly {
            ret := balance(0)
        }
    }

    function g() public returns (uint256 ret) {
        assembly {
            ret := balance(1)
        }
    }

    function h() public returns (uint256 ret) {
        assembly {
            ret := balance(address())
        }
    }
}
