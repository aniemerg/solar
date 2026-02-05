// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LibContractE {}

library LContract {
    function foo(LibContractE) internal pure returns (uint256) {
        return 42;
    }
}

contract InternalLibraryFunctionAttachedToContract {
    using LContract for LibContractE;

    function test() public returns (uint256) {
        LibContractE e = new LibContractE();
        return e.foo();
    }
}
