// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Base {
    constructor(uint256 i) {
        m_i = i;
    }

    uint256 public m_i;
}

contract Derived is Base {
    constructor(uint256 i) Base(i) {}
}

contract Final is Derived(4) {}
