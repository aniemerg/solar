// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ReturnDynamicTypesCrossCallAdvanced.sol";

// Ported from: abiEncoderV1/return_dynamic_types_cross_call_advanced.sol
// f() -> 0x80, -1, 0xe0, 0x1234, 40, "12345678901234567890123456789012", "34567890", 4, ...
contract ReturnDynamicTypesCrossCallAdvancedTest is Test {
    ReturnDynamicTypesCrossCallAdvanced c;

    function setUp() public {
        c = new ReturnDynamicTypesCrossCallAdvanced();
    }

    function test_f() public {
        (bytes memory a, uint b, bytes20[] memory cv, uint d) = c.f();
        assertEq(a.length, 40);
        assertEq(string(a), "1234567890123456789012345678901234567890");
        assertEq(b, type(uint).max);
        assertEq(cv.length, 4);
        assertEq(cv[0], bytes20(uint160(1234)));
        assertEq(cv[1], bytes20(0));
        assertEq(cv[2], bytes20(0));
        assertEq(cv[3], bytes20(uint160(6789)));
        assertEq(d, 0x1234);
    }
}
