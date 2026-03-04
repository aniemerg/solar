// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CopySubstructuresFromMapping {
    struct S {
        bytes b;
        uint16[] a;
        uint16 u;
    }

    constructor() {
        uint16[] memory a = new uint16[](2);
        a[0] = 13;
        a[1] = 14;

        m[7] = S({b: "foo", a: a, u: 7});
    }

    mapping(uint => S) m;
    S s;

    function to_state() public returns (S memory) {
        s.b = m[7].b;
        s.a = m[7].a;
        s.u = m[7].u;
        return s;
    }

    function to_storage() public returns (S memory) {
        S storage sLocal = s;
        sLocal.b = m[7].b;
        sLocal.a = m[7].a;
        sLocal.u = m[7].u;
        return sLocal;
    }

    function to_memory() public returns (S memory) {
        S memory sLocal;
        sLocal.b = m[7].b;
        sLocal.a = m[7].a;
        sLocal.u = m[7].u;
        return sLocal;
    }
}
