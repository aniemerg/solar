// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/CleanupBool.sol";

contract CleanupBoolTest is Test {
    CleanupBool c;

    function setUp() public {
        c = new CleanupBool();
    }

    function test_f_zero() public {
        // f(uint256): 0 -> false
        assertEq(c.f(0), false);
    }

    function test_gggg_false() public {
        // gggg(bool): 0 -> false
        assertEq(c.gggg(false), false);
    }

    function test_f_one() public {
        // f(uint256): 1 -> true
        assertEq(c.f(1), true);
    }

    function test_gggg_true() public {
        // gggg(bool): 1 -> true
        assertEq(c.gggg(true), true);
    }

    function test_f_two_returns_true() public {
        // f(uint256): 2 -> true
        // assembly stores 2 into bool, any non-zero is true internally
        assertEq(c.f(2), true);
    }

    function test_gggg_2_reverts() public {
        // gggg(bool): 2 -> FAILURE (non-canonical bool)
        bytes memory callData = abi.encodePacked(
            CleanupBool.gggg.selector,
            uint256(2)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_gggg_large_reverts() public {
        // gggg(bool): 0x1000 -> FAILURE
        bytes memory callData = abi.encodePacked(
            CleanupBool.gggg.selector,
            uint256(0x1000)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }
}
