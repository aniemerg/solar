// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Parent {
    function parentFun() external returns (uint256);
}

interface SubA is Parent {
    function subAFun() external returns (uint256);
}

interface SubB is Parent {
    function subBFun() external returns (uint256);
}

contract C is SubA, SubB {
    function parentFun() external override returns (uint256) {
        return 1;
    }

    function subAFun() external override returns (uint256) {
        return 2;
    }

    function subBFun() external override returns (uint256) {
        return 3;
    }

    function convertParent() public returns (uint256) {
        return this.parentFun();
    }

    function convertSubA() public returns (uint256, uint256) {
        return (this.parentFun(), this.subAFun());
    }

    function convertSubB() public returns (uint256, uint256) {
        return (this.parentFun(), this.subBFun());
    }
}
