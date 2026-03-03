// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ImmutableInheritance.sol";

contract ImmutableInheritanceTest {
    function test_ImmutableInheritance() public {
        ImmutableInheritanceD d = new ImmutableInheritanceD();
        (uint256 av, uint256 bv, uint cv, uint dv) = d.f();
        assert(av == 4);
        assert(bv == 3);
        assert(cv == 2);
        assert(dv == 1);
    }
}
