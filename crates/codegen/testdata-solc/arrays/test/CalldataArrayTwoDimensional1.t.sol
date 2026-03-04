// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayTwoDimensional1.sol";

contract CalldataArrayTwoDimensional1Test is Test {
    CalldataArrayTwoDimensional1 c;

    function setUp() public {
        c = new CalldataArrayTwoDimensional1();
    }

    function makeArray() internal pure returns (uint256[][] memory) {
        uint256[][] memory a = new uint256[][](2);
        a[0] = new uint256[](3);
        a[0][0] = 0x0A01; a[0][1] = 0x0A02; a[0][2] = 0x0A03;
        a[1] = new uint256[](4);
        a[1][0] = 0x0B01; a[1][1] = 0x0B02; a[1][2] = 0x0B03; a[1][3] = 0x0B04;
        return a;
    }

    function test_CalldataArrayTwoDimensional1() public {
        uint256[][] memory a = makeArray();

        assertEq(c.getLength(a), 2);
        assertEq(c.getInnerLength(a, 0), 3);
        assertEq(c.getInnerLength(a, 1), 4);

        assertEq(c.getElement(a, 0, 0), 0x0A01);
        assertEq(c.reenc(a, 0, 0), 0x0A01);
        assertEq(c.getElement(a, 0, 1), 0x0A02);
        assertEq(c.reenc(a, 0, 1), 0x0A02);
        assertEq(c.getElement(a, 0, 2), 0x0A03);
        assertEq(c.reenc(a, 0, 2), 0x0A03);

        assertEq(c.getElement(a, 1, 0), 0x0B01);
        assertEq(c.reenc(a, 1, 0), 0x0B01);
        assertEq(c.getElement(a, 1, 1), 0x0B02);
        assertEq(c.reenc(a, 1, 1), 0x0B02);
        assertEq(c.getElement(a, 1, 2), 0x0B03);
        assertEq(c.reenc(a, 1, 2), 0x0B03);
        assertEq(c.getElement(a, 1, 3), 0x0B04);
        assertEq(c.reenc(a, 1, 3), 0x0B04);

        // Out of bounds
        vm.expectRevert();
        c.getElement(a, 0, 3);

        vm.expectRevert();
        c.getElement(a, 1, 4);

        vm.expectRevert();
        c.getInnerLength(a, 2);
    }
}
