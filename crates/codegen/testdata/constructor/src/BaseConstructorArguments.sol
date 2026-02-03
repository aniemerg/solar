// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BaseBase {
    uint256 m_a;

    constructor(uint256 a) {
        m_a = a;
    }
}

contract Base is BaseBase(7) {
    constructor() {
        m_a *= m_a;
    }
}

contract BaseConstructorArguments is Base {
    function getA() public view returns (uint256 r) {
        return m_a;
    }
}
