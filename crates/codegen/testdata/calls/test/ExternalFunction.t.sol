// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExternalFunction.sol";

contract ExternalFunctionTest {
    ExternalFunction c;

    function setUp() public {
        c = new ExternalFunction();
    }

    function test_ExternalFunction() public view {
        (uint256 ra, uint256 rb) = c.checkExternal(2, 3);
        assert(ra == 9);
        assert(rb == 3);
    }
}
