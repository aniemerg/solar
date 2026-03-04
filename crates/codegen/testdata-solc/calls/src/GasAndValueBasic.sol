// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract helper {
    bool flag;

    function getBalance() public payable returns (uint256 myBalance) {
        return address(this).balance;
    }

    function setFlag() public {
        flag = true;
    }

    function getFlag() public returns (bool fl) {
        return flag;
    }
}

contract GasAndValueBasic {
    helper h;

    constructor() payable {
        h = new helper();
    }

    function sendAmount(uint256 amount) public payable returns (uint256 bal) {
        return h.getBalance{value: amount}();
    }

    function outOfGas() public returns (bool ret) {
        h.setFlag{gas: 2}(); // should fail due to OOG
        return true;
    }

    function checkState() public returns (bool flagAfter, uint256 myBal) {
        flagAfter = h.getFlag();
        myBal = address(this).balance;
    }
}
