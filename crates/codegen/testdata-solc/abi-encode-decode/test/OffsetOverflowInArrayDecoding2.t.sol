// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/OffsetOverflowInArrayDecoding2.sol";

contract OffsetOverflowInArrayDecoding2Test is Test {
    OffsetOverflowInArrayDecoding2 c;

    function setUp() public {
        c = new OffsetOverflowInArrayDecoding2();
    }

    function test_OffsetOverflowInArrayDecoding2() public {
        // Crafted corrupt ABI data causes within-array pointer overflow -> FAILURE
        vm.expectRevert();
        c.withinArray();
    }
}
