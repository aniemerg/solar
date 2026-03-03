// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TryCatchSimpleNoTuple.sol";

contract TryCatchSimpleNoTupleTest {
    function test_TryCatchSimpleNoTuple() public {
        TryCatchSimpleNoTuple c = new TryCatchSimpleNoTuple();
        assert(c.f(true) == 13);
        assert(c.f(false) == 9);
    }
}
