// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StructReference.sol";

contract StructReferenceTest {
    StructReference c;

    function setUp() public {
        c = new StructReference();
    }

    function test_StructReference() public {
        assert(c.check() == false);
        c.set();
        assert(c.check() == true);
    }
}
