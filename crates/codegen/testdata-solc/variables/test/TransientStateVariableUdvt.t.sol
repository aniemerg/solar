// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../src/TransientStateVariableUdvt.sol";

contract TransientStateVariableUdvtTest {
    TransientStateVariableUdvt c;

    function setUp() public {
        c = new TransientStateVariableUdvt();
    }

    function test_TransientStateVariableUdvt_x_initial() public view {
        // x() starts at 0 in fresh tx
        assert(MyInt.unwrap(c.x()) == 0);
    }

    function test_TransientStateVariableUdvt_g() public {
        // g() sets x=0, externally calls f() which sets x=2, returns x=2
        assert(MyInt.unwrap(c.g()) == 2);
    }

    function test_TransientStateVariableUdvt_h() public view {
        // h() in fresh tx: x=0 (transient resets)
        assert(MyInt.unwrap(c.h()) == 0);
    }
}
