// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataLengthRead.sol";

contract CalldataLengthReadTest is Test {
    CalldataLengthRead c;

    function setUp() public {
        c = new CalldataLengthRead();
    }

    // lenBytesRead(bytes): 0x20, 4, "abcd" -> 4
    function test_lenBytesRead_4() public {
        assertEq(c.lenBytesRead("abcd"), 4);
    }

    // lenBytesRead(bytes): 0x20, 0, "abcd" -> 0x00
    // The length field is 0 even though there's data
    function test_lenBytesRead_0() public {
        // length=0 encoded
        bytes memory raw = abi.encodePacked(
            bytes4(keccak256("lenBytesRead(bytes)")),
            uint256(0x20),   // offset
            uint256(0),      // length = 0
            bytes32("abcd")  // ignored
        );
        (bool ok, bytes memory ret) = address(c).call(raw);
        assertTrue(ok);
        uint l = abi.decode(ret, (uint));
        assertEq(l, 0);
    }

    // lenBytesRead(bytes): 0x20, 0x21, "abcd", "ef" -> 33
    function test_lenBytesRead_33() public {
        bytes memory raw = abi.encodePacked(
            bytes4(keccak256("lenBytesRead(bytes)")),
            uint256(0x20),   // offset
            uint256(0x21),   // length = 33
            bytes32("abcd"), // data word 1
            bytes32("ef")    // data word 2 (partial)
        );
        (bool ok, bytes memory ret) = address(c).call(raw);
        assertTrue(ok);
        uint l = abi.decode(ret, (uint));
        assertEq(l, 33);
    }

    // lenStringRead(string): 0x20, 4, "abcd" -> 4
    function test_lenStringRead_4() public {
        assertEq(c.lenStringRead("abcd"), 4);
    }

    // lenStringRead(string): 0x20, 0, "abcd" -> 0x00
    function test_lenStringRead_0() public {
        bytes memory raw = abi.encodePacked(
            bytes4(keccak256("lenStringRead(string)")),
            uint256(0x20),
            uint256(0),
            bytes32("abcd")
        );
        (bool ok, bytes memory ret) = address(c).call(raw);
        assertTrue(ok);
        uint l = abi.decode(ret, (uint));
        assertEq(l, 0);
    }

    // lenStringRead(string): 0x20, 0x21, "abcd", "ef" -> 33
    function test_lenStringRead_33() public {
        bytes memory raw = abi.encodePacked(
            bytes4(keccak256("lenStringRead(string)")),
            uint256(0x20),
            uint256(0x21),
            bytes32("abcd"),
            bytes32("ef")
        );
        (bool ok, bytes memory ret) = address(c).call(raw);
        assertTrue(ok);
        uint l = abi.decode(ret, (uint));
        assertEq(l, 33);
    }
}
