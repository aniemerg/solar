// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InlineMemberInitBase {
    uint256 m_base = 5;

    function getBMember() public returns (uint256 i) {
        return m_base;
    }
}

contract InlineMemberInitDerived is InlineMemberInitBase {
    uint256 m_derived = 6;

    function getDMember() public returns (uint256 i) {
        return m_derived;
    }
}
