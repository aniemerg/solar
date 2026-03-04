// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Base {
    uint256 data;

    function setData(uint256 i) public {
        data = i;
    }

    function getViaBase() public returns (uint256 i) {
        return data;
    }
}

contract A is Base {
    function setViaA(uint256 i) public {
        setData(i);
    }
}

contract B is Base {
    function getViaB() public returns (uint256 i) {
        return getViaBase();
    }
}

contract SingleCopyWithMultipleInheritance is Base, B, A {}
