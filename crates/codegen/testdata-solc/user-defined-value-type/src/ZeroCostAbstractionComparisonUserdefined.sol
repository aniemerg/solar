// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type MyInt is int;

contract ZeroCostAbstractionComparisonUserdefined {
    int x;
    function setX(MyInt _x) external {
        x = MyInt.unwrap(_x);
    }
    function getX() view external returns (MyInt) {
        return MyInt.wrap(x);
    }
    function add(MyInt a, MyInt b) pure external returns (MyInt) {
        return MyInt.wrap(MyInt.unwrap(a) + MyInt.unwrap(b));
    }
}
