// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionAttachedToContract.sol";

contract InternalLibraryFunctionAttachedToContractTest {
    InternalLibraryFunctionAttachedToContract c;

    function setUp() public {
        c = new InternalLibraryFunctionAttachedToContract();
    }

    function test_InternalLibraryFunctionAttachedToContract() public {
        assert(c.test() == 42);
    }
}
