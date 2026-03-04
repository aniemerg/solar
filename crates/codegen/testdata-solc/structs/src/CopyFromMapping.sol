// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CopyFromMapping {
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
        s = m[7];
        return s;
    }

    function to_storage() public returns (S memory) {
        S storage sLocal = s;
        sLocal = m[7];
        return sLocal;
    }

    function to_memory() public returns (S memory) {
        return m[7];
    }
}
