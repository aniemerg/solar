// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ImmutableStub.sol";

contract ImmutableStubTest {
    function test_ImmutableStub() public {
        ImmutableStub c = new ImmutableStub();
        (uint256 xv, uint256 yv) = c.f();
        assert(xv == 84);
        assert(yv == 23);
    }
}
