// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Arst {
    enum Foo {Things, Stuff}
}

contract LibraryEnumAsAnExpression {
    function f() public returns (uint256) {
        Arst.Foo;
        return 1;
    }
}
