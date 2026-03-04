// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataSliceAccess.sol";

contract CalldataSliceAccessTest is Test {
    CalldataSliceAccess c;

    function setUp() public {
        c = new CalldataSliceAccess();
    }

    function test_f_valid() public {
        uint256[] memory x1 = new uint256[](1);
        x1[0] = 42;

        // f: 0,0 on len-1 array -> ok
        c.f(x1, 0, 0);
        // f: 0,1 on len-1 array -> ok
        c.f(x1, 0, 1);
        // f: 1,1 on len-1 array -> ok
        c.f(x1, 1, 1);
    }

    function test_f_invalid_end_beyond() public {
        uint256[] memory x1 = new uint256[](1);
        x1[0] = 42;
        // f: 0,2 -> FAILURE (end > len)
        vm.expectRevert();
        c.f(x1, 0, 2);
    }

    function test_f_invalid_start_gt_end() public {
        uint256[] memory x1 = new uint256[](1);
        x1[0] = 42;
        // f: 1,0 -> FAILURE (start > end)
        vm.expectRevert();
        c.f(x1, 1, 0);
    }

    function test_f_invalid_both_ok_but_end_beyond() public {
        uint256[] memory x1 = new uint256[](1);
        x1[0] = 42;
        // f: 1,2 -> FAILURE
        vm.expectRevert();
        c.f(x1, 1, 2);
    }

    function test_f_invalid_start_gt_len() public {
        uint256[] memory x1 = new uint256[](1);
        x1[0] = 42;
        // f: 2,0 -> FAILURE
        vm.expectRevert();
        c.f(x1, 2, 0);
    }

    function test_f_invalid_both_beyond() public {
        uint256[] memory x1 = new uint256[](1);
        x1[0] = 42;
        // f: 2,1 -> FAILURE
        vm.expectRevert();
        c.f(x1, 2, 1);
    }

    function test_f_invalid_both_beyond2() public {
        uint256[] memory x1 = new uint256[](1);
        x1[0] = 42;
        // f: 2,2 -> FAILURE
        vm.expectRevert();
        c.f(x1, 2, 2);
    }

    function test_f_len2() public {
        uint256[] memory x2 = new uint256[](2);
        x2[0] = 42; x2[1] = 23;
        c.f(x2, 1, 2);
    }

    function test_f_len2_invalid() public {
        uint256[] memory x2 = new uint256[](2);
        x2[0] = 42; x2[1] = 23;
        vm.expectRevert();
        c.f(x2, 1, 3);
    }

    function test_g_basic() public {
        uint256[] memory x1 = new uint256[](1);
        x1[0] = 42;
        (uint256 a, uint256 b, uint256 cc) = c.g(x1, 0, 1, 0);
        assertEq(a, 42);
        assertEq(b, 42);
        assertEq(cc, 42);
    }

    function test_g_oob_index() public {
        uint256[] memory x1 = new uint256[](1);
        x1[0] = 42;
        vm.expectRevert();
        c.g(x1, 0, 1, 1);
    }

    function test_g_empty_slice() public {
        uint256[] memory x1 = new uint256[](1);
        x1[0] = 42;
        vm.expectRevert();
        c.g(x1, 0, 0, 0);
    }

    function test_g_len5() public {
        uint256[] memory x5 = new uint256[](5);
        x5[0] = 0x4201; x5[1] = 0x4202; x5[2] = 0x4203; x5[3] = 0x4204; x5[4] = 0x4205;

        (uint256 a, uint256 b, uint256 cc) = c.g(x5, 0, 5, 0);
        assertEq(a, 0x4201); assertEq(b, 0x4201); assertEq(cc, 0x4201);

        (a, b, cc) = c.g(x5, 0, 5, 4);
        assertEq(a, 0x4205); assertEq(b, 0x4205); assertEq(cc, 0x4205);

        (a, b, cc) = c.g(x5, 1, 5, 0);
        assertEq(a, 0x4202); assertEq(b, 0x4202); assertEq(cc, 0x4202);

        (a, b, cc) = c.g(x5, 1, 5, 3);
        assertEq(a, 0x4205); assertEq(b, 0x4205); assertEq(cc, 0x4205);

        (a, b, cc) = c.g(x5, 4, 5, 0);
        assertEq(a, 0x4205); assertEq(b, 0x4205); assertEq(cc, 0x4205);

        (a, b, cc) = c.g(x5, 0, 1, 0);
        assertEq(a, 0x4201); assertEq(b, 0x4201); assertEq(cc, 0x4201);

        (a, b, cc) = c.g(x5, 1, 2, 0);
        assertEq(a, 0x4202); assertEq(b, 0x4202); assertEq(cc, 0x4202);

        (a, b, cc) = c.g(x5, 4, 5, 0);
        assertEq(a, 0x4205); assertEq(b, 0x4205); assertEq(cc, 0x4205);
    }

    function test_g_len5_oob() public {
        uint256[] memory x5 = new uint256[](5);
        x5[0] = 0x4201; x5[1] = 0x4202; x5[2] = 0x4203; x5[3] = 0x4204; x5[4] = 0x4205;

        vm.expectRevert();
        c.g(x5, 0, 5, 5);

        vm.expectRevert();
        c.g(x5, 1, 5, 4);

        vm.expectRevert();
        c.g(x5, 4, 5, 1);

        vm.expectRevert();
        c.g(x5, 5, 5, 0);

        vm.expectRevert();
        c.g(x5, 0, 1, 1);

        vm.expectRevert();
        c.g(x5, 1, 2, 1);

        vm.expectRevert();
        c.g(x5, 4, 5, 1);
    }
}
