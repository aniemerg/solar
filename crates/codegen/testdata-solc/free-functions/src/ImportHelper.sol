// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct S {
    uint x;
}

function set(S storage a, uint v) {
    a.x = v;
}
