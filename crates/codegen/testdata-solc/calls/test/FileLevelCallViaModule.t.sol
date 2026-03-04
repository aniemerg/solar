// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FileLevelCallViaModule.sol";

contract FileLevelCallViaModuleTest {
    FileLevelCallViaModule c;

    function setUp() public {
        c = new FileLevelCallViaModule();
    }

    function test_run_returns_7_and_3() public view {
        (uint a, uint b) = c.run();
        assert(a == 7);
        assert(b == 3);
    }
}
