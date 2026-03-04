// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/AbiEncodeRationalV2.sol";

contract AbiEncodeRationalV2Test is Test {
    AbiEncodeRationalV2 c;

    function setUp() public {
        c = new AbiEncodeRationalV2();
    }

    function test_f() public {
        // f() -> 0x20, 0x40, 0x1, -2
        bytes memory result = c.f();
        (int256 a, int256 b) = abi.decode(result, (int256, int256));
        assertEq(a, 1);
        assertEq(b, -2);
    }
}
