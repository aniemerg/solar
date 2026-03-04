// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C1 {
    C1 public bla;

    constructor(C1 x) {
        bla = x;
    }
}

contract ExternalTypesInCalls {
    function test() public returns (C1 x, C1 y) {
        C1 c = new C1(C1(address(9)));
        x = c.bla();
        y = this.t1(C1(address(7)));
    }

    function t1(C1 a) public returns (C1) {
        return a;
    }

    function t2() public returns (C1) {
        return C1(address(9));
    }
}
