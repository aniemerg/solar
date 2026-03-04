// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../src/TransientStateVariableTupleAssignment.sol";

contract TransientStateVariableTupleAssignmentTest {
    function test_TransientStateVariableTupleAssignment() public {
        TransientStateVariableTupleAssignment c = new TransientStateVariableTupleAssignment();
        (uint xv, uint yv, uint wv) = c.f();
        // x=1,y=2,w=3,z=4 then (x,y,w)=(y,w,z)=(2,3,4)
        assert(xv == 2);
        assert(yv == 3);
        assert(wv == 4);
    }
}
