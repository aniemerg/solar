// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/OperatorMakingViewExternalCall.sol";

contract OperatorMakingViewExternalCallTest {
    function test_OperatorMakingViewExternalCall() public {
        C c = new C();
        assert(Int32.unwrap(c.runMul(Int32.wrap(42), Int32.wrap(10))) == 420);
        assert(Int32.unwrap(c.runInc(Int32.wrap(42))) == 43);
    }
}
