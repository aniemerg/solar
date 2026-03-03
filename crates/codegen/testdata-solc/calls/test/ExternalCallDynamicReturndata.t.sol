// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExternalCallDynamicReturndata.sol";

contract ExternalCallDynamicReturndataTest {
    ExternalCallDynamicReturndata c;

    function setUp() public {
        c = new ExternalCallDynamicReturndata();
    }

    function test_ExternalCallDynamicReturndata() public view {
        assert(c.dt(4) == 6);
    }
}
