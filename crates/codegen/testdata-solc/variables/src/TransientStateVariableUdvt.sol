// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

type MyInt is int256;
contract TransientStateVariableUdvt {
    MyInt transient public x;

    function f() public {
        x = MyInt.wrap(2);
    }
    function g() public returns (MyInt) {
        x = MyInt.wrap(0);
        this.f();
        return x;
    }
    function h() public view returns (MyInt) {
        return x;
    }
}
