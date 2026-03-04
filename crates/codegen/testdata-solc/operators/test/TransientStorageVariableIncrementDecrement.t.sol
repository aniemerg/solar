// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "../src/TransientStorageVariableIncrementDecrement.sol";

contract TransientStorageVariableIncrementDecrementTest {
    function test_TransientStorageVariableIncrementDecrement() public {
        C c = new C();
        // ++x(0->1), ++x(1->2), --x(2->1), x++(1->2 but returns 1... wait)
        // Actually: ++x returns new value, x++ returns old value
        // ++x: x=1; ++x: x=2; --x: x=1; x++: x=2 (pre-inc then return old); x--: x=1 (return old)
        // return x = 1
        assert(c.f() == 1);
    }
}
