// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalledContractHasCode {
    function f() external {}
    function g() external {
        CalledContractHasCode c = CalledContractHasCode(address(0));
        c.f();
    }
}
