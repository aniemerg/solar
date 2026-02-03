// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Denominations.sol";

contract DenominationsTest {
    function test_Denominations() public {
        Denominations c = new Denominations();
        assert(c.value() == 1000000001000000001);
    }
}
