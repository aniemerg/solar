// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

error E();

contract A {
    uint8[] x;

    function f() public {
        for (uint i = 0; i < 100; ++i)
            x.push(uint8(i));
        revert E();
    }
}

contract SmallErrorOptimization {
    function f() public {
        (new A()).f();
    }
}
