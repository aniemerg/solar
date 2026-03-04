// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SelectorTernaryFunctionPointerFromFunctionCall.sol";

contract SelectorTernaryFunctionPointerFromFunctionCallTest {
    function test_selectorTernaryFromCall() public {
        SelectorTernaryFunctionPointerFromFunctionCall c = new SelectorTernaryFunctionPointerFromFunctionCall();
        bytes4 fSel = A.f.selector;
        bytes4 gSel = A.g.selector;
        assert(c.run(true) == fSel);
        assert(c.run(false) == gSel);
    }
}
