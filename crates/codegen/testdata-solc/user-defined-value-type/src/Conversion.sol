// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type MyUInt8 is uint8;
type MyInt8 is int8;
type MyUInt16 is uint16;

contract Conversion {
    function f(uint a) external pure returns (MyUInt8) {
        return MyUInt8.wrap(uint8(a));
    }
    function g(uint a) external pure returns (MyInt8) {
        return MyInt8.wrap(int8(int(a)));
    }
    function h(MyUInt8 a) external pure returns (MyInt8) {
        return MyInt8.wrap(int8(MyUInt8.unwrap(a)));
    }
    function i(MyUInt8 a) external pure returns (MyUInt16) {
        return MyUInt16.wrap(MyUInt8.unwrap(a));
    }
    function j(MyUInt8 a) external pure returns (uint) {
        return MyUInt8.unwrap(a);
    }
    function k(MyUInt8 a) external pure returns (MyUInt16) {
        return MyUInt16.wrap(MyUInt8.unwrap(a));
    }
    function m(MyUInt16 a) external pure returns (MyUInt8) {
        return MyUInt8.wrap(uint8(MyUInt16.unwrap(a)));
    }
}
