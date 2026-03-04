// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SuperA {
    function f() public virtual returns (uint256 r) {
        return 1;
    }
}

contract SuperB is SuperA {
    function f() public virtual override returns (uint256 r) {
        return super.f() | 2;
    }
}

contract SuperC is SuperA {
    function f() public virtual override returns (uint256 r) {
        return super.f() | 4;
    }
}

contract Super is SuperB, SuperC {
    function f() public override(SuperB, SuperC) returns (uint256 r) {
        return super.f() | 8;
    }
}
