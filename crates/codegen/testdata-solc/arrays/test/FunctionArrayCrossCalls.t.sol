// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/FunctionArrayCrossCalls.sol";

contract FunctionArrayCrossCallsTest is Test {
    function test_FunctionArrayCrossCalls() public {
        FunctionArrayCrossCalls c = new FunctionArrayCrossCalls();
        (uint256 a, uint256 b, uint256 cc) = c.runTest();
        assertEq(a, 5);
        assertEq(b, 6);
        assertEq(cc, 7);
    }
}
