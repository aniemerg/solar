// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataOffsetReadWrite.sol";

contract CalldataOffsetReadWriteTest is Test {
    CalldataOffsetReadWrite c;

    function setUp() public {
        c = new CalldataOffsetReadWrite();
    }

    // f(uint256,bytes,uint256): 7, 0x60, 8, 2, 0 -> 8, 0x14
    // Assembly sets x.offset=8, x.length=20 (0x14), then reads them back
    function test_f_with_args() public {
        bytes memory raw = abi.encodePacked(
            bytes4(keccak256("f(uint256,bytes,uint256)")),
            uint256(7),
            uint256(0x60),
            uint256(8),
            uint256(2),
            uint256(0)
        );
        (bool ok, bytes memory ret) = address(c).call(raw);
        assertTrue(ok);
        (uint r, uint v) = abi.decode(ret, (uint, uint));
        assertEq(r, 8);
        assertEq(v, 0x14);
    }

    // f(uint256,bytes,uint256): 0, 0, 0 -> 8, 0x14
    // Same result regardless of input - assembly always overwrites offset and length
    function test_f_zeros() public {
        bytes memory raw = abi.encodePacked(
            bytes4(keccak256("f(uint256,bytes,uint256)")),
            uint256(0),
            uint256(0),
            uint256(0)
        );
        (bool ok, bytes memory ret) = address(c).call(raw);
        assertTrue(ok);
        (uint r, uint v) = abi.decode(ret, (uint, uint));
        assertEq(r, 8);
        assertEq(v, 0x14);
    }
}
