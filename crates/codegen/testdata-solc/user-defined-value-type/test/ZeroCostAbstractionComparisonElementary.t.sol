// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ZeroCostAbstractionComparisonElementary.sol";

contract ZeroCostAbstractionComparisonElementaryTest {
    function test_elementary() public {
        ZeroCostAbstractionComparisonElementary c = new ZeroCostAbstractionComparisonElementary();
        assert(c.getX() == 0);
        c.setX(5);
        assert(c.getX() == 5);
        assert(c.add(200, 99) == 299);
    }
}
