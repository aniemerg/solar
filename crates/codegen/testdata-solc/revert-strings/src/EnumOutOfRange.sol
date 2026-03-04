// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnumOutOfRange {
    enum E {X, Y}
    function f(E[] calldata arr) external pure {
        arr[1];
    }
}
