// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FixedArraysReturnA {
    function f(uint16 input) public pure returns (uint16[5] memory arr) {
        arr[0] = input;
        arr[1] = ++input;
        arr[2] = ++input;
        arr[3] = ++input;
        arr[4] = ++input;
    }
}

contract FixedArraysAsReturnType {
    function f() public returns (uint16[5] memory res, uint16[5] memory res2) {
        FixedArraysReturnA a = new FixedArraysReturnA();
        res = a.f(2);
        res2 = a.f(1000);
    }
}
