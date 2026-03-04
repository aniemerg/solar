// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InternalLibraryFunctionAttachedToInternalFunctionTypeNamedSelector.sol";

contract InternalLibraryFunctionAttachedToInternalFunctionTypeNamedSelectorTest {
    InternalLibraryFunctionAttachedToInternalFunctionTypeNamedSelector c;

    function setUp() public {
        c = new InternalLibraryFunctionAttachedToInternalFunctionTypeNamedSelector();
    }

    function test_test() public {
        // test(uint256): 5 -> 10
        assert(c.run(5) == 10);
    }
}
