// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TernaryOperatorWithLiteralTypesOverflow {
    function h() pure public returns (uint16 b) {
        b = (true ? 63 : 255) + (false ? 63 : 255);
    }

    function g() pure public returns (uint16 a) {
        bool t = true;
        bool f = false;
        a = (t ? 63 : 255) + (f ? 63 : 255);
    }
}
