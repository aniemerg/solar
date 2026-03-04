// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayAssignStatic.sol";

contract CalldataArrayAssignStaticTest is Test {
    CalldataArrayAssignStatic c;

    function setUp() public {
        c = new CalldataArrayAssignStatic();
    }

    // f(uint256[2][2]): 0x0, 8, 7, 6, 5 -> 8, 7, 6, 5
    // The static array x is normally at offset 0x04 in calldata.
    // assembly { x := 0x24 } reassigns x to offset 0x24=36 into msg.data
    // msg.data: [0..3]=selector, [4..35]=0x0, [36..67]=8, [68..99]=7, [100..131]=6, [132..163]=5
    // So x at offset 0x24 reads: 8,7,6,5
    function test_f() public {
        bytes memory raw = abi.encodePacked(
            c.f.selector,
            uint256(0),  // first word (ignored, x gets reassigned to 0x24)
            uint256(8),  // at 0x24
            uint256(7),
            uint256(6),
            uint256(5)
        );
        (bool ok, bytes memory ret) = address(c).call(raw);
        assertTrue(ok);
        uint[2][2] memory r = abi.decode(ret, (uint[2][2]));
        assertEq(r[0][0], 8);
        assertEq(r[0][1], 7);
        assertEq(r[1][0], 6);
        assertEq(r[1][1], 5);
    }
}
