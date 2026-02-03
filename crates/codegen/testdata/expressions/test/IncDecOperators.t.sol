// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/IncDecOperators.sol";

contract IncDecOperatorsTest {
    function test_IncDecOperators() public {
        IncDecOperators c = new IncDecOperators();
        uint256 result = c.f();
        assert(result == 0x053866);
    }
}
