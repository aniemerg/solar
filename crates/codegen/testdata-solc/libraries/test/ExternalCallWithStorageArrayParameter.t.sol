// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExternalCallWithStorageArrayParameter.sol";

contract ExternalCallWithStorageArrayParameterTest {
    ExternalCallWithStorageArrayParameter c;

    function setUp() public {
        c = new ExternalCallWithStorageArrayParameter();
    }

    function test_g() public {
        // g(uint256): 4 -> 16
        assert(c.g(4) == 16);
    }
}
