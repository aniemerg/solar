// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CleanupReencodedCalldataString.sol";

contract CleanupReencodedCalldataStringTest is Test {
    CleanupReencodedCalldataString c;

    function setUp() public {
        c = new CleanupReencodedCalldataString();
    }

    function test_test() public {
        // test() -> 0x20, 0x60, 0x20, 3, "abc"
        bytes memory result = c.test();
        // abi.encode("abc") = offset(0x20) + length(3) + "abc" padded
        string memory decoded = abi.decode(result, (string));
        assertEq(decoded, "abc");
    }
}
