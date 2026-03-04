// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type MyInt is int;

contract Simple {
    function f() external pure returns (MyInt a) {
    }
    function g() external pure returns (MyInt b, MyInt c) {
        b = MyInt.wrap(int(1));
        c = MyInt.wrap(1);
    }
}
