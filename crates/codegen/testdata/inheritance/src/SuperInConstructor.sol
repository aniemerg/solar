// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SuperInConstructorA {
    function f() public virtual returns (uint256) {
        return 1;
    }
}

contract SuperInConstructorB is SuperInConstructorA {
    function f() public virtual override returns (uint256) {
        return super.f() | 2;
    }
}

contract SuperInConstructorC is SuperInConstructorA {
    function f() public virtual override returns (uint256) {
        return super.f() | 4;
    }
}

contract SuperInConstructorD is SuperInConstructorB, SuperInConstructorC {
    uint256 data;

    constructor() {
        data = super.f() | 8;
    }

    function f() public override(SuperInConstructorB, SuperInConstructorC) returns (uint256) {
        return data;
    }
}
