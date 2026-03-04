// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../src/TransientStateVariable.sol";

contract TransientStateVariableTest {
    TransientStateVariable c;

    function setUp() public {
        c = new TransientStateVariable();
    }

    // Each test_ function is a fresh transaction, so transient resets between tests
    function test_TransientStateVariable_x_initial() public view {
        // x() starts at 0 in each fresh tx
        assert(c.x() == 0);
    }

    function test_TransientStateVariable_g() public {
        // g() sets x=0, then externally calls f() which sets x=8, then returns x=8
        assert(c.g() == 8);
    }

    function test_TransientStateVariable_h() public view {
        // h() in a fresh tx: x is 0 (transient resets each tx)
        assert(c.h() == 0);
    }
}
