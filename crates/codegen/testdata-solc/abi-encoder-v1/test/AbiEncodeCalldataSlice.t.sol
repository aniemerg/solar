// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/AbiEncodeCalldataSlice.sol";

// Ported from: abiEncoderV1/abi_encode_calldata_slice.sol
// test_bytes() ->
// test_uint256() ->
contract AbiEncodeCalldataSliceTest is Test {
    AbiEncodeCalldataSlice c;

    function setUp() public {
        c = new AbiEncodeCalldataSlice();
    }

    function test_bytes() public {
        c.test_bytes();
    }

    function test_uint256() public {
        c.test_uint256();
    }
}
