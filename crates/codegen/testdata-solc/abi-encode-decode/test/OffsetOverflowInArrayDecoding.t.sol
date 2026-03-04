// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/OffsetOverflowInArrayDecoding.sol";

contract OffsetOverflowInArrayDecodingTest is Test {
    OffsetOverflowInArrayDecoding c;

    function setUp() public {
        c = new OffsetOverflowInArrayDecoding();
    }

    function test_OffsetOverflowInArrayDecoding() public {
        // Crafted corrupt ABI data causes pointer overflow during decode -> FAILURE
        vm.expectRevert();
        c.run();
    }
}
