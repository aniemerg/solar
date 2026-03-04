// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/BytesConcatAsArgument.sol";

contract BytesConcatAsArgumentTest is Test {
    function test_BytesConcatAsArgument_keccak() public {
        BytesConcatAsArgument c = new BytesConcatAsArgument();
        bytes memory a = "abcdabcdabcdabcdabcdabcdabcdabcd";
        bytes memory b = "bcdef";
        bytes32 result = c.f(a, b);
        assertEq(result, keccak256(abi.encodePacked(a, b)));
    }

    function test_BytesConcatAsArgument_length() public {
        BytesConcatAsArgument c = new BytesConcatAsArgument();
        bytes memory a = "abcdabcdabcdabcdabcdabcdabcdabcd";
        bytes memory b = "bcdef";
        uint256 result = c.g(a, b);
        assertEq(result, 37);
    }
}
