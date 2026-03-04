// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CreateCalldata.sol";

contract CreateCalldataTest {
    CreateCalldata c;

    function setUp() public {
        c = new CreateCalldata();
    }

    function test_deploy() public {
        address deployed = c.deploy(42);
        CreateCalldataHelper helper = CreateCalldataHelper(deployed);
        // s should be empty since msg.data is empty during legacy construction
        assert(helper.s().length == 0);
    }
}
