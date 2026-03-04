// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/DecodeSlice.sol";

// Ported from: abiEncoderV1/decode_slice.sol
// f(uint256,uint256): 42, 23 -> 42, 23, 42, 23
contract DecodeSliceTest is Test {
    DecodeSlice c;

    function setUp() public {
        c = new DecodeSlice();
    }

    function test_f() public {
        (uint256 cv, uint256 d, uint256 e, uint256 g) = c.f(42, 23);
        assertEq(cv, 42);
        assertEq(d, 23);
        assertEq(e, 42);
        assertEq(g, 23);
    }
}
