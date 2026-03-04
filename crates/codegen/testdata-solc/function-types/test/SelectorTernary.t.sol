// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SelectorTernary.sol";

contract SelectorTernaryTest {
    function test_selectorTernary() public {
        SelectorTernary c = new SelectorTernary();
        bytes4 fSel = c.f.selector;
        bytes4 gSel = c.g.selector;
        assert(c.h(true) == fSel);
        assert(c.h(false) == gSel);
    }
}
