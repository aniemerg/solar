// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ReturnDynamicTypesCrossCallSimple.sol";

// Ported from: abiEncoderV1/return_dynamic_types_cross_call_simple.sol
// f() -> 0x20, 40, "12345678901234567890123456789012", "34567890"
contract ReturnDynamicTypesCrossCallSimpleTest is Test {
    ReturnDynamicTypesCrossCallSimple c;

    function setUp() public {
        c = new ReturnDynamicTypesCrossCallSimple();
    }

    function test_f() public {
        bytes memory result = c.f();
        assertEq(result.length, 40);
        assertEq(string(result), "1234567890123456789012345678901234567890");
    }
}
