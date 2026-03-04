// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/BytesToFixedBytesSimple.sol";

contract BytesToFixedBytesSimpleTest is Test {
    function test_BytesToFixedBytesSimple() public {
        BytesToFixedBytesSimple c = new BytesToFixedBytesSimple();
        assertEq(c.fromMemory("abcdefghabcdefgh"), bytes16("abcdefghabcdefgh"));
        assertEq(c.fromCalldata("abcdefghabcdefgh"), bytes16("abcdefghabcdefgh"));
        assertEq(c.fromStorage(), bytes16("abcdefghabcdefgh"));
        assertEq(c.fromStorageLong(), bytes32("abcdefghabcdefghabcdefghabcdefgh"));
        assertEq(c.fromSlice("abcdefghabcdefgh"), bytes8("bcdefgha"));
    }
}
