// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodeLength {
    uint256 len1;
    uint256 len2;

    constructor() {
        len1 = address(0).code.length;
        len2 = address(this).code.length;
    }

    function f() public view returns (bool r1, bool r2) {
        r1 = address(this).code.length > 50;
        address a = address(0);
        r2 = a.code.length == 0;
    }
}
