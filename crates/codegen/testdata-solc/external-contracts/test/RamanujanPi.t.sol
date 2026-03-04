// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/RamanujanPi.sol";

contract RamanujanPiTest {
    RamanujanPi c;

    function setUp() public {
        c = new RamanujanPi();
    }

    function test_prb_pi() public view {
        assert(c.prb_pi() == 3141592656369545286);
    }
}
