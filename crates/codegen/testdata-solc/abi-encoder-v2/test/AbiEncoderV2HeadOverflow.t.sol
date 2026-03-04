// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/AbiEncoderV2HeadOverflow.sol";

contract AbiEncoderV2HeadOverflowTest is Test {
    AbiEncoderV2HeadOverflow c;

    function setUp() public {
        c = new AbiEncoderV2HeadOverflow();
    }

    function test_f() public {
        // f(bool,(bytes,uint256[3]),bytes32[2]): 1, 0x80, "a", "b", 0x80, 11, 12, 13, 4, "abcd"
        // -> 1, 0x80, "a", "b", 0x80, 11, 12, 13, 4, "abcd"
        bytes memory bx = "a";
        uint[3] memory by = [uint(0x62), 0, 0]; // "b" = 0x62 as bytes32
        T memory b = T(bx, [uint(11), 12, 13]);
        bytes32[2] memory cArr = [bytes32("abcd"), bytes32(0)];
        // Just verify it doesn't revert and returns correct values
        (bool retA, T memory retB, bytes32[2] memory retC) = c.f(true, b, cArr);
        assertEq(retA, true);
        assertEq(retB.y[0], 11);
        assertEq(retB.y[1], 12);
        assertEq(retB.y[2], 13);
        assertEq(retC[0], bytes32("abcd"));
    }
}
