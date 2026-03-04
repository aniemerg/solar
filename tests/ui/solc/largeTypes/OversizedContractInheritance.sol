//@ compile-flags: -Ztypeck
// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.0;
contract C {
    uint[2**255] a;
}
contract D is C { //~ ERROR: contract requires too much storage
    uint[2**255] b;
}
