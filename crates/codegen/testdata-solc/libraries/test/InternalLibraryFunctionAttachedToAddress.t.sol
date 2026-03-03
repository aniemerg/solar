// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionAttachedToAddress.sol";

contract InternalLibraryFunctionAttachedToAddressTest {
    InternalLibraryFunctionAttachedToAddress c;

    function setUp() public {
        c = new InternalLibraryFunctionAttachedToAddress();
    }

    function test_InternalLibraryFunctionAttachedToAddress() public view {
        address a = 0x111122223333444455556666777788889999aAaa;
        assert(c.foo(a, a) == true);
        assert(c.foo(a, address(0)) == false);
    }
}
