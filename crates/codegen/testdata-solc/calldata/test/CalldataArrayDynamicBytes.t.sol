// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataArrayDynamicBytes.sol";

contract CalldataArrayDynamicBytesTest {
    CalldataArrayDynamicBytes c;

    function setUp() public {
        c = new CalldataArrayDynamicBytes();
    }

    function test_f1() public view {
        bytes[] memory a = new bytes[](1);
        a[0] = abi.encodePacked(bytes1(0x01), bytes1(0x02), bytes1(0x03));
        bytes[1] memory af;
        af[0] = a[0];
        (uint256 len, uint256 b0, uint256 b1, uint256 b2) = c.f1(af);
        assert(len == 3);
        assert(b0 == 1);
        assert(b1 == 2);
        assert(b2 == 3);
    }

    function test_f2() public view {
        bytes[1] memory a;
        bytes[1] memory b;
        a[0] = abi.encodePacked(bytes1(0x01), bytes1(0x02), bytes1(0x03));
        b[0] = abi.encodePacked(bytes1(0x01), bytes1(0x02));
        (uint256 la, uint256 a0, uint256 a1, uint256 a2, uint256 lb, uint256 bb0, uint256 bb1) = c.f2(a, b);
        assert(la == 3);
        assert(a0 == 1);
        assert(a1 == 2);
        assert(a2 == 3);
        assert(lb == 2);
        assert(bb0 == 1);
        assert(bb1 == 2);
    }

    function test_g1() public view {
        bytes[2] memory a;
        a[0] = abi.encodePacked(bytes1(0x01), bytes1(0x02), bytes1(0x03));
        a[1] = abi.encodePacked(bytes1(0x04), bytes1(0x05), bytes1(0x06));
        (uint256 l0, uint256 a00, uint256 a01, uint256 a02,
         uint256 l1, uint256 a10, uint256 a11, uint256 a12) = c.g1(a);
        assert(l0 == 3);
        assert(a00 == 1);
        assert(a01 == 2);
        assert(a02 == 3);
        assert(l1 == 3);
        assert(a10 == 4);
        assert(a11 == 5);
        assert(a12 == 6);
    }

    function test_g2() public view {
        bytes[] memory a = new bytes[](2);
        a[0] = abi.encodePacked(bytes1(0x01), bytes1(0x02));
        a[1] = abi.encodePacked(bytes1(0x04), bytes1(0x05), bytes1(0x06));
        uint256[8] memory r = c.g2(a);
        assert(r[0] == 2);
        assert(r[1] == 2);
        assert(r[2] == 1);
        assert(r[3] == 2);
        assert(r[4] == 3);
        assert(r[5] == 4);
        assert(r[6] == 5);
        assert(r[7] == 6);
    }
}
