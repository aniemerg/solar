// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructStorageToMapping {
    struct S {
        uint a;
    }
    S s;
    mapping(uint => S) m;

    function f() external returns (bool) {
        s.a = 12;
        m[1] = s;
        return m[1].a == 12;
    }
}
