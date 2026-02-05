// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BytesComparison.sol";

contract BytesComparisonTest {
    function test_BytesComparison() public {
        BytesComparison c = new BytesComparison();
        assert(c.f() == true);
    }
}
