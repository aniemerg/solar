// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library L {
    struct S {
        uint256 v;
    }
    modifier mod(S storage s) {
        s.v++;
        _;
    }

    function libFun(S storage s) internal mod(s) {
        s.v += 0x100;
    }
}


contract FunctionModifierLibraryInheritance {
    using L for *;
    L.S s;
    modifier mod(L.S storage) {
        revert();
        _;
    }

    function f() public returns (uint256) {
        s.libFun();
        L.libFun(s);
        return s.v;
    }
}
