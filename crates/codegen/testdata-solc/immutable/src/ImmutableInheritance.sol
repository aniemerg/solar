// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ImmutableInheritanceA {
    uint8 immutable a;

    constructor() {
        a = 4;
    }
}

contract ImmutableInheritanceB is ImmutableInheritanceA {
    uint8 immutable b;

    constructor() {
        b = 3;
    }
}

contract ImmutableInheritanceC is ImmutableInheritanceA {
    uint8 immutable c;

    constructor() {
        c = 2;
    }
}

contract ImmutableInheritanceD is ImmutableInheritanceB, ImmutableInheritanceC {
    uint8 immutable d;

    constructor() {
        d = 1;
    }

    function f() public view returns (uint256, uint256, uint, uint) {
        return (a, b, c, d);
    }
}
