// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Post-Cancun: selfdestruct sends Ether but contract code remains
contract SelfdestructPostCancunC {
    constructor() payable {}

    function terminate() external {
        selfdestruct(payable(msg.sender));
    }
}

contract SelfdestructPostCancun {
    SelfdestructPostCancunC public c;

    constructor() payable {}

    function deployCreate() public payable {
        c = new SelfdestructPostCancunC{value: 1 ether}();
    }

    function terminate() public {
        c.terminate();
    }

    function exists() public view returns (bool) {
        return address(c).code.length != 0;
    }

    function balanceOfC() public view returns (uint256) {
        return address(c).balance;
    }

    function balanceSelf() public view returns (uint256) {
        return address(this).balance;
    }
}
