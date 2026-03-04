// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ReturnSizeShorterThanExpectedAfterHomestead.sol";

contract ReturnSizeShorterThanExpectedAfterHomesteadTest is Test {
    ReturnSizeShorterThanExpectedAfterHomestead c;

    function setUp() public {
        c = new ReturnSizeShorterThanExpectedAfterHomestead();
    }

    function test_test_reverts() public {
        // After homestead: ABI decoding fails when return data is too short
        vm.expectRevert();
        c.run();
    }
}
