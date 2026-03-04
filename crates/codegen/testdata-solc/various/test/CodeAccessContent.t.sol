// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CodeAccessContent.sol";

contract CodeAccessContentTest {
    CodeAccessContent c;

    function setUp() public {
        c = new CodeAccessContent();
    }

    function test_testRuntime() public {
        assert(c.testRuntime() == true);
    }

    function test_testCreation() public {
        assert(c.testCreation() == true);
    }
}
