// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    receive() external payable {
        revert("no_receive");
    }
}

contract Transfer {
    A a;

    constructor() {
        a = new A();
    }

    receive() external payable {}

    function f() public {
        payable(a).transfer(1 wei);
    }

    function h() public {
        payable(a).transfer(100 ether);
    }

    function g() public view returns (uint) {
        return payable(this).balance;
    }
}
