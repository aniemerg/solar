// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Arst2 {
    struct Foo {
        int256 Things;
        int256 Stuff;
    }
}

contract LibraryStructAsAnExpression {
    function f() public returns (uint256) {
        Arst2.Foo;
        return 1;
    }
}
