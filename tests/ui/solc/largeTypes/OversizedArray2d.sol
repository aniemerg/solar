//@ compile-flags: -Ztypeck
// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.0;
contract C { //~ ERROR: contract requires too much storage
    uint[2**255][2] a;
}
