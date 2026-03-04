// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SingleCopyWithMultipleInheritance.sol";

contract SingleCopyWithMultipleInheritanceTest {
    SingleCopyWithMultipleInheritance c;

    function setUp() public {
        c = new SingleCopyWithMultipleInheritance();
    }

    function test_single_copy() public {
        assert(c.getViaB() == 0);
        c.setViaA(23);
        assert(c.getViaB() == 23);
    }
}
