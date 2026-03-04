// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemberNotationCtorC {
    int private x;

    constructor(int p) {
        x = p;
    }

    function getX() public returns (int) {
        return x;
    }
}

contract MemberNotationCtorD is MemberNotationCtorC {
    constructor(int p) MemberNotationCtorC(p) {}
}

contract MemberNotationCtorA {
    function g(int p) public returns (int) {
        MemberNotationCtorD d = new MemberNotationCtorD(p);
        return d.getX();
    }
}
