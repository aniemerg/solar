// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/BoolConversionV2.sol";

contract BoolConversionV2Test is Test {
    BoolConversionV2 c;

    function setUp() public {
        c = new BoolConversionV2();
    }

    function test_BoolConversionV2_Valid() public view {
        assert(c.f(false) == 0);
        assert(c.f(true) == 1);
        assert(c.g(false) == false);
        assert(c.g(true) == true);
    }

    // With ABI encoder v2, passing non-boolean values (0x2, 0x3, 0xff) reverts
    // because the decoder validates that bool inputs are 0 or 1.
    function test_BoolConversionV2_InvalidBool_f_2() public {
        // Calling f with raw bool value 0x2 should revert under ABIv2
        (bool success,) = address(c).call(
            abi.encodeWithSelector(BoolConversionV2.f.selector, uint256(2))
        );
        assert(!success);
    }

    function test_BoolConversionV2_InvalidBool_f_ff() public {
        (bool success,) = address(c).call(
            abi.encodeWithSelector(BoolConversionV2.f.selector, uint256(0xff))
        );
        assert(!success);
    }

    function test_BoolConversionV2_InvalidBool_g_2() public {
        (bool success,) = address(c).call(
            abi.encodeWithSelector(BoolConversionV2.g.selector, uint256(2))
        );
        assert(!success);
    }

    function test_BoolConversionV2_InvalidBool_g_ff() public {
        (bool success,) = address(c).call(
            abi.encodeWithSelector(BoolConversionV2.g.selector, uint256(0xff))
        );
        assert(!success);
    }
}
