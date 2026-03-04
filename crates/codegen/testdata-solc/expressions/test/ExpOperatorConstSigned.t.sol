// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ExpOperatorConstSigned.sol";

contract ExpOperatorConstSignedTest {
    function test_expConstSigned() public {
        ExpOperatorConstSigned c = new ExpOperatorConstSigned();
        assert(c.f() == -8);
    }
}
