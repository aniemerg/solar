// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MultiCreation.sol";

contract MultiCreationTest {
    function test_MultiCreation() public {
        MultiCreation c = new MultiCreation();
        (uint256 av, uint bv, uint cv) = c.f();
        assert(av == 3);
        assert(bv == 7);
        assert(cv == 5);
        assert(c.x() == 7);
        assert(c.y() == 5);
    }
}
