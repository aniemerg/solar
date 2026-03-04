// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataAssignFromNowhere.sol";

contract CalldataAssignFromNowhereTest is Test {
    CalldataAssignFromNowhere c;

    function setUp() public {
        c = new CalldataAssignFromNowhere();
    }

    // f() -> 0x20, 4, 0x26121ff000000000000000000000000000000000000000000000000000000000
    // x.offset=0, x.length=4 -> reads 4 bytes from calldata[0] = the selector itself
    // The selector of f() is keccak256("f()")[0:4]
    function test_f() public {
        (bool ok, bytes memory ret) = address(c).call(abi.encodeWithSignature("f()"));
        assertTrue(ok);
        bytes memory result = abi.decode(ret, (bytes));
        assertEq(result.length, 4);
        // The 4 bytes should equal the selector
        bytes4 sel = bytes4(keccak256("f()"));
        assertEq(bytes4(result), sel);
    }
}
