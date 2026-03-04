// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/BytesConcat3Args.sol";

contract BytesConcat3ArgsTest is Test {
    function test_BytesConcat3Args_short() public {
        BytesConcat3Args c = new BytesConcat3Args();
        bytes memory result = c.f("abc", "de", "fgh");
        assertEq(result.length, 8);
        assertEq(result, "abcdefgh");
    }

    function test_BytesConcat3Args_long() public {
        BytesConcat3Args c = new BytesConcat3Args();
        bytes memory a = "abcdabcdabcdabcdabcdabcdabcdabcd";
        bytes memory b = "bcdef";
        bytes memory cv = "abc";
        bytes memory result = c.f(a, b, cv);
        assertEq(result.length, 40);
        assertEq(result, abi.encodePacked(a, b, cv));
    }
}
