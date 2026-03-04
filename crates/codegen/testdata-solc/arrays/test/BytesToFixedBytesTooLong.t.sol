// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/BytesToFixedBytesTooLong.sol";

contract BytesToFixedBytesTooLongTest is Test {
    function test_BytesToFixedBytesTooLong() public {
        BytesToFixedBytesTooLong c = new BytesToFixedBytesTooLong();
        // 33-byte input truncates to 32 bytes
        bytes memory input33 = "abcdefghabcdefghabcdefghabcdefgha";
        assertEq(c.fromMemory(input33), bytes32("abcdefghabcdefghabcdefghabcdefgh"));
        assertEq(c.fromCalldata(input33), bytes32("abcdefghabcdefghabcdefghabcdefgh"));
        assertEq(c.fromStorage(), bytes32("abcdefghabcdefghabcdefghabcdefgh"));
        assertEq(c.fromSlice(input33), bytes32("abcdefghabcdefghabcdefghabcdefgh"));
    }
}
