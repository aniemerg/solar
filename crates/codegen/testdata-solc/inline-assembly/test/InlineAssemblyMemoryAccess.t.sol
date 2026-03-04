// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineAssemblyMemoryAccess.sol";

contract InlineAssemblyMemoryAccessTest is Test {
    InlineAssemblyMemoryAccess c;

    function setUp() public {
        c = new InlineAssemblyMemoryAccess();
    }

    // test() -> 0x20, 0x5, "12345"
    // Creates bytes(5) and overwrites it with mstore at offset 32 -> "12345678..."
    // Returns first 5 bytes: "12345"
    function test_test() public {
        bytes memory result = c.test();
        assertEq(result.length, 5);
        assertEq(result[0], bytes1("1"));
        assertEq(result[1], bytes1("2"));
        assertEq(result[2], bytes1("3"));
        assertEq(result[3], bytes1("4"));
        assertEq(result[4], bytes1("5"));
    }
}
