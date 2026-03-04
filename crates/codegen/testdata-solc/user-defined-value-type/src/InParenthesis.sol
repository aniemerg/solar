// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type MyInt is int;

contract InParenthesis {
    function f() public pure returns (MyInt a, int b) {
        (MyInt).wrap;
        a = (MyInt).wrap(5);
        (MyInt).unwrap;
        b = (MyInt).unwrap((MyInt).wrap(10));
    }
}
