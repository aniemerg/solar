// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type MyInt is int16;
type MyBytes is bytes2;

contract ImmutableSigned {
    MyInt immutable a = MyInt.wrap(-2);
    MyBytes immutable b = MyBytes.wrap("ab");

    function direct() view external returns (MyInt, MyBytes) {
        return (a, b);
    }
    function viaasm() view external returns (bytes32 x, bytes32 y) {
        MyInt _a = a;
        MyBytes _b = b;
        assembly { x := _a y := _b }
    }
}
