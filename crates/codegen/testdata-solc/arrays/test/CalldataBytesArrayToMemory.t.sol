// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/CalldataBytesArrayToMemory.sol";

contract CalldataBytesArrayToMemoryTest {
    function test_CalldataBytesArrayToMemory() public {
        CalldataBytesArrayToMemory c = new CalldataBytesArrayToMemory();

        // f(bytes[]): 0x20, 0x1, 0x20, 0x2, hex"6162" -> 0x1, 0x2, 0x60, 0x2, hex"6162..."
        // length 2, data "ab"
        bytes[] memory inp1 = new bytes[](1);
        inp1[0] = hex"6162";
        (uint256 l1, uint256 m1, bytes memory b1) = c.f(inp1);
        assert(l1 == 1);
        assert(m1 == 2);
        assert(b1.length == 2);
        assert(b1[0] == 0x61);
        assert(b1[1] == 0x62);

        // f(bytes[]): 0x20, 0x1, 0x20, 0x20, hex"7878...78" -> 0x1, 0x20, ...
        // length 32, data 32 x 0x78
        bytes[] memory inp2 = new bytes[](1);
        inp2[0] = hex"7878787878787878787878787878787878787878787878787878787878787878";
        (uint256 l2, uint256 m2, bytes memory b2) = c.f(inp2);
        assert(l2 == 1);
        assert(m2 == 32);
        assert(b2.length == 32);
        assert(b2[0] == 0x78);

        // f(bytes[]): 0x20, 0x1, 0x20, 0x20, hex"7800...61" -> 0x1, 0x20, ...
        bytes[] memory inp3 = new bytes[](1);
        inp3[0] = hex"7800000000000000000000000000000000000000000000000000000000000061";
        (uint256 l3, uint256 m3, bytes memory b3) = c.f(inp3);
        assert(l3 == 1);
        assert(m3 == 32);
        assert(b3.length == 32);
        assert(b3[0] == 0x78);
        assert(b3[31] == 0x61);

        // f(bytes[]): 0x20, 0x1, 0x20, 0x20, hex"6100...78" -> 0x1, 0x20, ...
        bytes[] memory inp4 = new bytes[](1);
        inp4[0] = hex"6100000000000000000000000000000000000000000000000000000000000078";
        (uint256 l4, uint256 m4, bytes memory b4) = c.f(inp4);
        assert(l4 == 1);
        assert(m4 == 32);
        assert(b4.length == 32);
        assert(b4[0] == 0x61);
        assert(b4[31] == 0x78);
    }
}
