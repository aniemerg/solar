// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SendersBalanceC {
    function f() public view returns (uint256) {
        return msg.sender.balance;
    }
}

contract SendersBalance {
    SendersBalanceC c = new SendersBalanceC();

    constructor() payable {}

    function f() public view returns (uint256) {
        return c.f();
    }
}
