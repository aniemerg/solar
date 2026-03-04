// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/SlotAccessViaMappingPointer.sol";

contract SlotAccessViaMappingPointerTest is Test {
    SlotAccessViaMappingPointer c;

    function setUp() public {
        c = new SlotAccessViaMappingPointer();
    }

    // f(uint256): 0 -> 0, 0
    function test_f_0() public {
        (uint slot, uint offset) = c.f(0);
        assertEq(slot, 0);
        assertEq(offset, 0);
    }

    // f(uint256): 1 -> 1, 0
    function test_f_1() public {
        (uint slot, uint offset) = c.f(1);
        assertEq(slot, 1);
        assertEq(offset, 0);
    }

    // f(uint256): 2 -> 2, 0
    function test_f_2() public {
        (uint slot, uint offset) = c.f(2);
        assertEq(slot, 2);
        assertEq(offset, 0);
    }
}
