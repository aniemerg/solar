// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "forge-std/Test.sol";
import "../src/Calldata2dBytesToMemory2.sol";

contract Calldata2dBytesToMemory2Test is Test {
    function test_Calldata2dBytesToMemory2() public {
        Calldata2dBytesToMemory2 c = new Calldata2dBytesToMemory2();
        // f(bytes[2]): 0x20, 0x40, 0x40, 2, "ab" -> (no revert)
        bytes[2] memory inp1;
        inp1[0] = "ab";
        inp1[1] = "ab";
        c.f(inp1);

        // f(bytes[2]): 0x20, 0x40, 0x40, 1, "a" -> FAILURE, panic(1)
        bytes[2] memory inp2;
        inp2[0] = "a";
        inp2[1] = "a";
        vm.expectRevert();
        c.f(inp2);
    }
}
