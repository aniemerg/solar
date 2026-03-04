// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayRead.sol";

contract CalldataArrayReadTest is Test {
    CalldataArrayRead c;

    function setUp() public {
        c = new CalldataArrayRead();
    }

    // f(uint256[2][]): 0x20, 2, 1, 2, 3, 4 -> 0x44, 2, 0x84
    // ABI: selector(4) + offset(32) + length(32) + [pair0: 1,2](64) + [pair1: 3,4](64)
    // x.offset = 0x44 = 4+32+32 = 68 (start of array elements in calldata)
    // x.length = 2
    // t = x[1] -> offset = 0x44 + 64 = 0x84
    function test_f() public {
        uint[2][] memory arr = new uint[2][](2);
        arr[0][0] = 1;
        arr[0][1] = 2;
        arr[1][0] = 3;
        arr[1][1] = 4;
        (uint o, uint l, uint s) = c.f(arr);
        assertEq(o, 0x44);
        assertEq(l, 2);
        assertEq(s, 0x84);
    }
}
