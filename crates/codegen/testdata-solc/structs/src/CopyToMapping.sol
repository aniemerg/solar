// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CopyToMapping {
    struct S {
        bytes b;
        uint16[] a;
        uint16 u;
    }

    S s;

    constructor() {
        uint16[] memory a = new uint16[](2);
        a[0] = 13;
        a[1] = 14;

        s.b = "foo";
        s.a = a;
        s.u = 21;
    }

    mapping(uint => S) m;

    function from_state() public returns (S memory) {
        m[0] = s;
        return m[0];
    }

    function from_storage() public returns (S memory) {
        S storage sLocal = s;
        m[1] = sLocal;
        return m[1];
    }

    function from_memory() public returns (S memory) {
        S memory sMemory = s;
        m[2] = sMemory;
        return m[2];
    }

    function from_calldata(S calldata sCalldata) public returns (S memory) {
        m[3] = sCalldata;
        return m[3];
    }
}
