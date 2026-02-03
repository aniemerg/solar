// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IEnumRef {
    enum Direction { A, B, Left, Right }
}

library LEnumRef {
    enum Direction { Left, Right }
    function f() public pure returns (Direction) {
        return Direction.Right;
    }
    function g() public pure returns (IEnumRef.Direction) {
        return IEnumRef.Direction.Right;
    }
}

contract EnumReferencing is IEnumRef {
    function f() public pure returns (Direction) {
        return Direction.Right;
    }
    function g() public pure returns (IEnumRef.Direction) {
        return IEnumRef.Direction.Right;
    }
    function h() public pure returns (LEnumRef.Direction) {
        return LEnumRef.Direction.Right;
    }
    function x() public pure returns (LEnumRef.Direction) {
        return LEnumRef.f();
    }
    function y() public pure returns (IEnumRef.Direction) {
        return LEnumRef.g();
    }
}
