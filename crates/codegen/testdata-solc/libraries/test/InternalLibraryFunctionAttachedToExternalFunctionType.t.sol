// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionAttachedToExternalFunctionType.sol";

contract InternalLibraryFunctionAttachedToExternalFunctionTypeTest {
    InternalLibraryFunctionAttachedToExternalFunctionType c;

    function setUp() public {
        c = new InternalLibraryFunctionAttachedToExternalFunctionType();
    }

    function test_test() public {
        // test(uint256): 5 -> 10
        assert(c.run(5) == 10);
    }
}
