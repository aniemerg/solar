// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

error E(string a, uint[] b);

contract RevertConversion {
    uint[] x;

    function f() public {
        x.push(7);
        revert E("abc", x);
    }
}
