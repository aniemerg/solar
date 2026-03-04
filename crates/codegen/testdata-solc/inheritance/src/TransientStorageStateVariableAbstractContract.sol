// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

abstract contract A {
    uint256 transient x;
    int256 y;

    function f() public virtual returns (uint256, int256, uint256, int256);
}

contract C is A {
    uint256 w;
    int256 transient z;

    function g() public {
        w += 2;
        z += 2;
    }

    function f() public override returns (uint256, int256, uint256, int256) {
        x += 1;
        y += 1;
        g();
        return (x, y, w, z);
    }
}
