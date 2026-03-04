// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/BoolOutOfBounds.sol";

contract BoolOutOfBoundsTest is Test {
    BoolOutOfBounds c;

    function setUp() public {
        c = new BoolOutOfBounds();
    }

    function test_f_true() public {
        // f(bool): true -> true
        assertEq(c.f(true), true);
    }

    function test_f_false() public {
        // f(bool): false -> false
        assertEq(c.f(false), false);
    }

    function test_f_zero() public {
        // f(bool): 0x000000 -> false
        // Canonical encoding of false is 0 - this succeeds
        assertEq(c.f(false), false);
    }

    function test_f_noncanonical_reverts() public {
        // f(bool): 0xffffff -> FAILURE
        // Non-canonical bool (value > 1) causes revert in ABI decoding with v2 encoder
        // We simulate this via low-level call with non-canonical bool encoding
        bytes memory callData = abi.encodeWithSelector(
            BoolOutOfBounds.f.selector,
            uint256(0xffffff)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }
}
