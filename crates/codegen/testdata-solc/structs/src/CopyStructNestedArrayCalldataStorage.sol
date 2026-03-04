// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CopyStructNestedArrayCalldataStorage {
    struct S {
        uint8[1] x;
        uint8[] y;
    }

    S s;

    function run(S calldata src) public {
        s = src;

        require(s.x[0] == 3);
        require(s.y.length == 2);
        require(s.y[0] == 7);
        require(s.y[1] == 11);
    }
}
