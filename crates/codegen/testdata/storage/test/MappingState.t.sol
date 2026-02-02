// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MappingState.sol";

contract MappingStateTest {
    MappingState c;

    function setUp() public {
        c = new MappingState();
    }

    function test_MappingState() public {
        address a0 = address(0);
        address a1 = address(1);
        address a2 = address(2);

        assert(c.getVoteCount(a0) == 0);
        assert(c.getVoteCount(a1) == 0);
        assert(c.getVoteCount(a2) == 0);

        assert(c.vote(a0, a2) == false);
        assert(c.getVoteCount(a2) == 0);

        c.grantVoteRight(a0);
        c.grantVoteRight(a1);
        assert(c.vote(a0, a2) == true);
        assert(c.getVoteCount(a2) == 1);

        assert(c.vote(a0, a1) == false);
        assert(c.getVoteCount(a1) == 0);
        assert(c.getVoteCount(a2) == 1);

        assert(c.vote(a2, a1) == false);
        assert(c.getVoteCount(a1) == 0);
        assert(c.getVoteCount(a2) == 1);

        c.grantVoteRight(a2);
        assert(c.vote(a2, a1) == true);
        assert(c.getVoteCount(a1) == 1);
        assert(c.getVoteCount(a2) == 1);
    }
}
