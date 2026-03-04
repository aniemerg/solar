// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayOfStruct.sol";

contract CalldataArrayOfStructTest is Test {
    function test_CalldataArrayOfStruct() public {
        CalldataArrayOfStruct c = new CalldataArrayOfStruct();
        CalldataArrayOfStruct.S[] memory s = new CalldataArrayOfStruct.S[](2);
        s[0] = CalldataArrayOfStruct.S(1, 2);
        s[1] = CalldataArrayOfStruct.S(3, 4);
        (uint256 l, uint256 a, uint256 b, uint256 cc, uint256 d) = c.f(s);
        assertEq(l, 2);
        assertEq(a, 1);
        assertEq(b, 2);
        assertEq(cc, 3);
        assertEq(d, 4);
    }
}
