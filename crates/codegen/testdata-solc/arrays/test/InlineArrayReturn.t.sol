// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/InlineArrayReturn.sol";

contract InlineArrayReturnTest is Test {
    function test_InlineArrayReturn() public {
        InlineArrayReturn c = new InlineArrayReturn();
        uint8[5] memory result = c.f();
        assertEq(result[0], 1);
        assertEq(result[1], 2);
        assertEq(result[2], 3);
        assertEq(result[3], 4);
        assertEq(result[4], 5);
    }
}
