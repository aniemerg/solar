// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/PrecompileExtcodesizeCheck.sol";

contract PrecompileExtcodesizeCheckTest is Test {
    PrecompileExtcodesizeCheck c;

    function setUp() public {
        c = new PrecompileExtcodesizeCheck();
    }

    function test_checkHighLevel_returns_true() public view {
        // Precompile at address(4) (identity) handles the call even with extcodesize=0
        // This works because solc skips extcodesize check for known precompile addresses
        assert(c.checkHighLevel() == true);
    }

    function test_checkHighLevel2_reverts() public {
        // Identity precompile echoes back input (selector + value = 36 bytes),
        // but caller expects 3 uint256 (96 bytes), so ABI decoding fails.
        vm.expectRevert();
        c.checkHighLevel2();
    }

    function test_checkLowLevel() external view {
        // Low-level staticcall to identity precompile echoes back the encoded data
        // The returned bytes encode: selector (4 bytes) + uint256(5) (32 bytes) = 36 bytes
        // Decoded as uint256: first 32 bytes = selector padded
        uint val = c.checkLowLevel();
        // The identity precompile returns the input as-is:
        // input = abi.encodeWithSelector(selectorAndAppendValue.selector, 5)
        // = bytes4(selector) ++ bytes32(5)
        // decoded as uint = first 32 bytes of output = selector left-padded in first 4 bytes
        assert(val == 0xc76596d400000000000000000000000000000000000000000000000000000000);
    }
}
