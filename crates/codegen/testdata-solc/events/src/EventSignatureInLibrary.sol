// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library L {
    struct S {
        uint8 a;
        int16 b;
    }
    event E(S indexed, S);
    function f() internal {
        S memory s;
        emit E(s, s);
    }
}
contract EventSignatureInLibrary {
    constructor() {
        L.f();
    }
}
