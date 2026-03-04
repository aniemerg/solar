// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BaseBase {
    uint256 m_a;

    constructor(uint256 a) {
        m_a = a;
    }

    function overridden() public virtual returns (uint256 r) {
        return 1;
    }

    function g() public returns (uint256 r) {
        return overridden();
    }
}

contract Base is BaseBase(BaseBase.g()) {}

contract VirtualFunctionUsageInConstructorArguments is Base {
    function getA() public returns (uint256 r) {
        return m_a;
    }

    function overridden() public override returns (uint256 r) {
        return 2;
    }
}
