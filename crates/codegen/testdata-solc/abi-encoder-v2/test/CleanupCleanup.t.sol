// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CleanupCleanup.sol";

contract CleanupCleanupTest is Test {
    CleanupCleanup c;

    function setUp() public {
        c = new CleanupCleanup();
    }

    function test_f_valid() public {
        // f(uint16,int16,address,bytes3,bool): 1, 2, 3, "a", true -> 1, 2, 3, "a", true
        (uint v, uint w, uint x, uint y, uint z) = c.f(1, 2, address(3), "a", true);
        assertEq(v, 1);
        assertEq(w, 2);
        assertEq(x, 3);
        assertEq(y, uint256(bytes32("a")));
        assertEq(z, 1);
    }

    function test_f_invalid_uint16_reverts() public {
        // f(uint16,int16,address,bytes3,bool): 0xffffff, ... -> FAILURE
        bytes memory callData = abi.encodePacked(
            CleanupCleanup.f.selector,
            uint256(0xffffff),    // invalid uint16
            uint256(0),
            uint256(0),
            bytes32("bcd"),
            uint256(1)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_f_invalid_int16_reverts() public {
        // f(uint16,int16,address,bytes3,bool): 0, 0x1ffff, ... -> FAILURE
        bytes memory callData = abi.encodePacked(
            CleanupCleanup.f.selector,
            uint256(0),
            uint256(0x1ffff),    // invalid int16
            uint256(0),
            bytes32("ab"),
            uint256(1)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_f_invalid_bool_reverts() public {
        // f(uint16,int16,address,bytes3,bool): 0, 0, 0, "abc", 2 -> FAILURE
        bytes memory callData = abi.encodePacked(
            CleanupCleanup.f.selector,
            uint256(0),
            uint256(0),
            uint256(0),
            bytes32("abc"),
            uint256(2)    // invalid bool
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }
}
