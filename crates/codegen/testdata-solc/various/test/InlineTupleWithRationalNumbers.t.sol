// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/InlineTupleWithRationalNumbers.sol";

contract InlineTupleWithRationalNumbersTest {
    InlineTupleWithRationalNumbers c;

    function setUp() public {
        c = new InlineTupleWithRationalNumbers();
    }

    function test_f() public {
        assert(c.f() == 1);
    }
}
