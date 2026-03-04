// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/MemoryParamsInExternalFunction.sol";

// Ported from: abiEncoderV1/memory_params_in_external_function.sol
// g() -> 3, 0x6200000000000000000000000000000000000000000000000000000000000000, 3, 0x6600000000000000000000000000000000000000000000000000000000000000, 4, 7
contract MemoryParamsInExternalFunctionTest is Test {
    MemoryParamsInExternalFunction c;

    function setUp() public {
        c = new MemoryParamsInExternalFunction();
    }

    function test_g() public {
        (uint aLen, bytes1 aChar, uint bLen, bytes1 bChar, uint cLen, uint cVal) = c.g();
        assertEq(aLen, 3);       // "abc" has length 3
        assertEq(aChar, bytes1("b")); // a[1] = 'b'
        assertEq(bLen, 3);       // "def" has length 3
        assertEq(bChar, bytes1("f")); // b[2] = 'f'
        assertEq(cLen, 4);       // array has 4 elements
        assertEq(cVal, 7);       // c[3] = 7
    }
}
