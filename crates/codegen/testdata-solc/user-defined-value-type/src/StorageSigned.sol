// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type MyInt is int16;

contract StorageSigned {
    bytes2 first = "ab";
    MyInt public a = MyInt.wrap(-2);
    bytes2 third = "ef";

    function direct() external view returns (MyInt) {
        return a;
    }
    function indirect() external view returns (int16) {
        return MyInt.unwrap(a);
    }
    function toMemDirect() external view returns (MyInt[1] memory) {
        return [a];
    }
    function toMemIndirect() external view returns (int16[1] memory) {
        return [MyInt.unwrap(a)];
    }
    function div() external view returns (int16) {
        return MyInt.unwrap(a) / 2;
    }
    function viaasm() external view returns (bytes32 x) {
        MyInt st = a;
        assembly { x := st }
    }
}
