// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MultipleReturnValues.sol";

contract MultipleReturnValuesTest {
    MultipleReturnValues c;

    function setUp() public {
        c = new MultipleReturnValues();
    }

    function test_MultipleReturnValues() public {
        (uint256 y1, bool y2, uint256 y3) = c.run(true, 0xcd);
        assert(y1 == 0xcd);
        assert(y2 == true);
        assert(y3 == 0);
    }
}
