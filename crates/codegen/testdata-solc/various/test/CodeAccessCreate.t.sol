// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CodeAccessCreate.sol";

contract CodeAccessCreateTest {
    CodeAccessCreate c;

    function setUp() public {
        c = new CodeAccessCreate();
    }

    function test_test() public {
        assert(c.test() == 7);
    }
}
