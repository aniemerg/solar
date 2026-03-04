// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayFunctionTypes.sol";

contract CalldataArrayFunctionTypesTest is Test {
    CalldataArrayFunctionTypes c;

    function setUp() public {
        c = new CalldataArrayFunctionTypes();
    }

    function test_g_no_reenc() public {
        // g(bool): false -> 23, 37, 71
        (uint a, uint b, uint cc) = c.g(false);
        assertEq(a, 23);
        assertEq(b, 37);
        assertEq(cc, 71);
    }

    function test_g_reenc() public {
        // g(bool): true -> 23, 37, 71
        (uint a, uint b, uint cc) = c.g(true);
        assertEq(a, 23);
        assertEq(b, 37);
        assertEq(cc, 71);
    }
}
