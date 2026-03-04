// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CalldataArrayDynamicInvalid.sol";

contract CalldataArrayDynamicInvalidTest is Test {
    CalldataArrayDynamicInvalid c;

    function setUp() public {
        c = new CalldataArrayDynamicInvalid();
    }

    // Helper to call f(uint256[][]) with raw calldata words
    function callF(bytes memory encodedArgs) internal returns (bool success, uint256 result) {
        bytes memory callData = abi.encodePacked(c.f.selector, encodedArgs);
        (bool ok, bytes memory ret) = address(c).call(callData);
        success = ok;
        if (ok && ret.length >= 32) {
            result = abi.decode(ret, (uint256));
        }
    }

    function callG(bytes memory encodedArgs) internal returns (bool success, uint256 result) {
        bytes memory callData = abi.encodePacked(c.g.selector, encodedArgs);
        (bool ok, bytes memory ret) = address(c).call(callData);
        success = ok;
        if (ok && ret.length >= 32) {
            result = abi.decode(ret, (uint256));
        }
    }

    function test_CalldataArrayDynamicInvalid() public {
        bool ok;
        uint256 res;

        // f(uint256[][]): 0x20, 0x0 -> 42 (valid: empty outer array)
        (ok, res) = callF(abi.encode(uint256(0x20), uint256(0)));
        assertTrue(ok);
        assertEq(res, 42);

        // f(uint256[][]): 0x20, 0x1 -> FAILURE (invalid: length=1 but no offset data)
        (ok,) = callF(abi.encodePacked(uint256(0x20), uint256(1)));
        assertFalse(ok);

        // f(uint256[][]): 0x20, 0x1, 0x20 -> 42 (invalid outer, but f doesn't access elements)
        (ok, res) = callF(abi.encodePacked(uint256(0x20), uint256(1), uint256(0x20)));
        assertTrue(ok);
        assertEq(res, 42);

        // g(uint256[][]): 0x20, 0x1, 0x20 -> FAILURE (g accesses a[0] which is malformed)
        (ok,) = callG(abi.encodePacked(uint256(0x20), uint256(1), uint256(0x20)));
        assertFalse(ok);

        // f(uint256[][]): 0x20, 0x1, 0x20, 0x2, 0x42 -> 42
        (ok, res) = callF(abi.encodePacked(uint256(0x20), uint256(1), uint256(0x20), uint256(2), uint256(0x42)));
        assertTrue(ok);
        assertEq(res, 42);

        // g(uint256[][]): 0x20, 0x1, 0x20, 0x2, 0x42 -> FAILURE (inner array claims len=2 but only 1 element)
        (ok,) = callG(abi.encodePacked(uint256(0x20), uint256(1), uint256(0x20), uint256(2), uint256(0x42)));
        assertFalse(ok);
    }
}
