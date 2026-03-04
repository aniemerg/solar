// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract B {
    uint x;

    function getBalance() public view returns (uint) {
        return address(this).balance * 1000 + x;
    }

    constructor(uint _x) payable {
        x = _x;
    }
}

contract SaltedCreateWithValue {
    function f() public payable returns (uint, uint, uint) {
        B x = new B{salt: "abc", value: 3}(7);
        B y = new B{value: 3, salt: "abc2"}(8);
        B z = new B{salt: "abc3", value: 3}(9);
        return (x.getBalance(), y.getBalance(), z.getBalance());
    }
}
