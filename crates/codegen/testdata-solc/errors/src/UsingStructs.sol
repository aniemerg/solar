// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

struct S {
    uint a;
    string b;
}

error E(uint a, S s, uint b);

contract UsingStructs {
    S s;

    function f(bool c) public {
        if (c) {
            s.a = 9;
            s.b = "abc";
            revert E(2, s, 7);
        } else {
            revert E({b: 7, a: 2, s: S({b: "abc", a: 9})});
        }
    }
}
