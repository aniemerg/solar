// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/BytesConcat2Args.sol";

contract BytesConcat2ArgsTest is Test {
    function test_BytesConcat2Args_simple() public {
        BytesConcat2Args c = new BytesConcat2Args();
        bytes memory a = "abc";
        bytes memory b = "def";
        bytes memory result = c.f(a, b);
        assertEq(result.length, 6);
        assertEq(result, "abcdef");
    }

    function test_BytesConcat2Args_32plus5() public {
        BytesConcat2Args c = new BytesConcat2Args();
        bytes memory a = "abcdabcdabcdabcdabcdabcdabcdabcd";
        bytes memory b = "bcdef";
        bytes memory result = c.f(a, b);
        assertEq(result.length, 37);
        assertEq(result, abi.encodePacked(a, b));
    }
}
