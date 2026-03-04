// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/McopyEmpty.sol";

contract McopyEmptyTest is Test {
    McopyEmpty c;

    function setUp() public {
        c = new McopyEmpty();
    }

    // mcopy_zero(bytes): input -> same output (zero-length copies have no effect)
    function test_mcopy_zero() public {
        bytes memory pattern = hex"ffeeddccbbaa9988776655443322110000112233445566778899aabbccddeeff";
        bytes memory out = c.mcopy_zero(pattern);
        assertEq(out, pattern);
    }
}
