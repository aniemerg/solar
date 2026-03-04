// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/BytesConcatDifferentTypes.sol";

contract BytesConcatDifferentTypesTest is Test {
    function test_BytesConcatDifferentTypes_f() public {
        BytesConcatDifferentTypes c = new BytesConcatDifferentTypes();
        bytes memory a = "abcdabcdabcdabcdabcdabcdabcdabcd";
        bytes memory result = c.f(a);
        assertEq(result.length, 37);
        assertEq(result, abi.encodePacked(a, "bcdef"));
    }

    function test_BytesConcatDifferentTypes_g() public {
        BytesConcatDifferentTypes c = new BytesConcatDifferentTypes();
        bytes memory a = "abcdabcdabcdabcdabcdabcdabcdabcd";
        bytes memory result = c.g(a);
        assertEq(result.length, 66);
        assertEq(result, abi.encodePacked(a, "abcdefghabcdefghabcdefghabcdefghab"));
    }

    function test_BytesConcatDifferentTypes_h() public {
        BytesConcatDifferentTypes c = new BytesConcatDifferentTypes();
        bytes memory a = "abcdabcdabcdabcdabcdabcdabcdabcd";
        bytes memory result = c.h(a);
        assertEq(result.length, 37);
        assertEq(result, abi.encodePacked(a, "bcdef"));
    }

    function test_BytesConcatDifferentTypes_j() public {
        BytesConcatDifferentTypes c = new BytesConcatDifferentTypes();
        bytes memory a = "abcdabcdabcdabcdabcdabcdabcdabcd";
        bytes memory result = c.j(a);
        assertEq(result.length, 42);
        assertEq(result, abi.encodePacked(a, "bcdef", "bcdef"));
    }

    function test_BytesConcatDifferentTypes_k() public {
        BytesConcatDifferentTypes c = new BytesConcatDifferentTypes();
        bytes memory a = "abcdabcdabcdabcdabcdabcdabcdabcd";
        bytes memory result = c.k(a, "bcdef");
        assertEq(result.length, 37);
        assertEq(result, abi.encodePacked(a, "bcdef"));
    }

    function test_BytesConcatDifferentTypes_slice() public {
        BytesConcatDifferentTypes c = new BytesConcatDifferentTypes();
        bytes memory result = c.slice("abcd");
        assertEq(result.length, 4);
        assertEq(result, "abcd");
    }

    function test_BytesConcatDifferentTypes_strParam() public {
        BytesConcatDifferentTypes c = new BytesConcatDifferentTypes();
        bytes memory result = c.strParam("abcdabcdabcdabcdabcdabcdabcdabcd");
        assertEq(result.length, 37);
        assertEq(result, abi.encodePacked("abcdabcdabcdabcdabcdabcdabcdabcd", "bcdef"));
    }
}
