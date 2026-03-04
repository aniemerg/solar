// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SameFunctionInConstructionAndRuntime.sol";

contract SameFunctionInConstructionAndRuntimeTest {
    function test_constructionAndRuntime() public {
        SameFunctionInConstructionAndRuntime c = new SameFunctionInConstructionAndRuntime();
        assert(c.runtime(3) == 6);
        assert(c.initial() == 4);
    }
}
