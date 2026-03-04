// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayDynamicStaticInLibrary.sol";

contract CalldataArrayDynamicStaticInLibraryTest is Test {
    CalldataArrayDynamicStaticInLibrary c;

    function setUp() public {
        c = new CalldataArrayDynamicStaticInLibrary();
    }

    function test_f() public {
        // f(uint256[],uint256[1]): 0x40, 0xff, 1, 0xffff -> 0x40, 0xff, 0x01, 0xffff
        uint[] memory a = new uint[](1);
        a[0] = 0xff;
        uint[1] memory b;
        b[0] = 0xffff;
        (uint[] memory retA, uint[1] memory retB) = c.f(a, b);
        assertEq(retA.length, 1);
        assertEq(retA[0], 0xff);
        assertEq(retB[0], 0xffff);
    }
}
