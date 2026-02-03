// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BaseArrayCtor {
    uint256 public m_x;
    address[] m_s;

    constructor(uint256 x, address[] memory s) {
        m_x = x;
        m_s = s;
    }

    function part(uint256 i) public view returns (address) {
        return m_s[i];
    }
}

contract ArraysInConstructors is BaseArrayCtor {
    constructor(address[] memory s, uint256 x) BaseArrayCtor(x, f(s)) {}

    function f(address[] memory s) public pure returns (address[] memory) {
        return s;
    }
}

contract ArraysInConstructorsCreator {
    function f(uint256 x, address[] memory s) public returns (uint256 r, address ch) {
        ArraysInConstructors c = new ArraysInConstructors(s, x);
        r = c.m_x();
        ch = c.part(x);
    }
}
