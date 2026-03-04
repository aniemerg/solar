// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExternalCallWithStorageMappingParameter.sol";

contract ExternalCallWithStorageMappingParameterTest {
    ExternalCallWithStorageMappingParameter c;

    function setUp() public {
        c = new ExternalCallWithStorageMappingParameter();
    }

    function test_g() public {
        // g(uint256): 4 -> 16
        assert(c.g(4) == 16);
    }
}
