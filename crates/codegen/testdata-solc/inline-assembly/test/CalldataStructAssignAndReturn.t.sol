// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataStructAssignAndReturn.sol";

contract CalldataStructAssignAndReturnTest is Test {
    CalldataStructAssignAndReturn c;

    function setUp() public {
        c = new CalldataStructAssignAndReturn();
    }

    // g(): 0xCAFFEE, 0x42, 0x21 -> 0x42, 0x21
    // s := 0x24 -> reads from calldata[0x24] which is after selector(4) + 0x20
    // Actually 0x24 from start of msg.data -> byte 36 of calldata
    // msg.data: [0..3]=selector, [4..35]=0xCAFFEE(first param??)
    // Wait - g() takes no parameters. The calldata is just the selector.
    // But the test sends extra calldata: "0xCAFFEE, 0x42, 0x21"
    // Extra calldata: 0xCAFFEE (padded) at positions 4..35, 0x42 at 36..67, 0x21 at 68..99
    // s := 0x24 means s points to calldata offset 0x24 = 36
    // S has int8 x, int8 y. At offset 36: 0x42 and 0x21 (as padded words)
    // But S struct is two int8 fields packed in ABI as two words
    // Actually for calldata struct, x is at calldata[0x24], y is at calldata[0x24+32]
    // So x=0x42, y=0x21
    function test_g_normal() public {
        bytes memory raw = abi.encodePacked(
            bytes4(keccak256("g()")),
            uint256(0xCAFFEE),
            int256(0x42),
            int256(0x21)
        );
        (bool ok, bytes memory ret) = address(c).call(raw);
        assertTrue(ok);
        (int8 x, int8 y) = abi.decode(ret, (int8, int8));
        assertEq(x, 0x42);
        assertEq(y, 0x21);
    }

    // g(): 0xCAFFEE, 0x4242, 0x2121 -> FAILURE (out of range for int8)
    function test_g_failure() public {
        bytes memory raw = abi.encodePacked(
            bytes4(keccak256("g()")),
            uint256(0xCAFFEE),
            int256(0x4242),
            int256(0x2121)
        );
        (bool ok, ) = address(c).call(raw);
        assertFalse(ok);
    }

    // g(): 0xCAFFEE, 0x42 -> 0x42, 0 (y reads zero/default)
    function test_g_partial() public {
        bytes memory raw = abi.encodePacked(
            bytes4(keccak256("g()")),
            uint256(0xCAFFEE),
            int256(0x42)
            // no third word, y reads as 0
        );
        (bool ok, bytes memory ret) = address(c).call(raw);
        assertTrue(ok);
        (int8 x, int8 y) = abi.decode(ret, (int8, int8));
        assertEq(x, 0x42);
        assertEq(y, 0);
    }

    // h() -> 0x42
    function test_h() public {
        assertEq(c.h(), 0x42);
    }

    // i() -> FAILURE (abi.decode with wrong data)
    function test_i() public {
        vm.expectRevert();
        c.i();
    }
}
