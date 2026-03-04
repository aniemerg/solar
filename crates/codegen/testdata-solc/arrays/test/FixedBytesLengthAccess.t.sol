// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/FixedBytesLengthAccess.sol";

contract FixedBytesLengthAccessTest is Test {
    function test_FixedBytesLengthAccess() public {
        FixedBytesLengthAccess c = new FixedBytesLengthAccess();
        (uint256 a, uint256 b, uint256 cc) = c.f("789");
        assertEq(a, 32);
        assertEq(b, 16);
        assertEq(cc, 8);
    }
}
