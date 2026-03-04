// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/OffsetOverflowInArrayDecoding3.sol";

contract OffsetOverflowInArrayDecoding3Test is Test {
    OffsetOverflowInArrayDecoding3 c;

    function setUp() public {
        c = new OffsetOverflowInArrayDecoding3();
    }

    function test_OffsetOverflowInArrayDecoding3() public {
        // Crafted corrupt ABI data with max-value offsets causes overflow -> FAILURE
        vm.expectRevert();
        c.run();
    }
}
