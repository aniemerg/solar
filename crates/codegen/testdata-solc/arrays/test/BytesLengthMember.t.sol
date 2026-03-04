// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/BytesLengthMember.sol";

contract BytesLengthMemberTest is Test {
    function test_BytesLengthMember() public {
        BytesLengthMember c = new BytesLengthMember();
        assertEq(c.getLength(), 0);
        // setData() is called with its own calldata (4-byte selector + encoded args)
        // The original test calls set(): 1, 2 -> true, which has a specific calldata length
        // In Foundry we test the semantic: setData copies msg.data, getLength returns its length
        assertTrue(c.setData());
        // After setData(), data = calldata of the setData() call = 4 bytes (just selector)
        assertEq(c.getLength(), 4);
    }
}
