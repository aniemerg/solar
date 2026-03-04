// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Import.sol";

contract ImportTest {
    function test_Import() public {
        Import c = new Import();
        (uint one, uint two) = c.f(7);
        assert(one == 7 && two == 8);
    }
}
