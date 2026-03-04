// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IFoo {}
contract EFoo is IFoo {}

library LInterface {
    function foo(IFoo i) internal pure returns (uint256) {
        return 42;
    }
}

contract InternalLibraryFunctionAttachedToInterface {
    using LInterface for IFoo;

    function run() public returns (uint256) {
        EFoo e = new EFoo();
        return IFoo(e).foo();
    }
}
