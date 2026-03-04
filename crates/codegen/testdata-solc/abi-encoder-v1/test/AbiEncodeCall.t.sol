// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/AbiEncodeCall.sol";

// Ported from: abiEncoderV1/abi_encode_call.sol
// f() -> true
contract AbiEncodeCallTest is Test {
    AbiEncodeCall c;

    function setUp() public {
        c = new AbiEncodeCall();
    }

    function test_f() public {
        bool result = c.f();
        assertTrue(result);
    }
}
