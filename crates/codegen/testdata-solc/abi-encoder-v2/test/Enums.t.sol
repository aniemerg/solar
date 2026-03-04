// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/Enums.sol";

contract EnumsTest is Test {
    Enums c;

    function setUp() public {
        c = new Enums();
    }

    function test_f_A() public {
        // f(uint8): 0 -> 0
        assertEq(c.f(Enums.E.A), 0);
    }

    function test_f_B() public {
        // f(uint8): 1 -> 1
        assertEq(c.f(Enums.E.B), 1);
    }

    function test_f_invalid_2_reverts() public {
        // f(uint8): 2 -> FAILURE
        bytes memory callData = abi.encodePacked(
            Enums.f.selector,
            uint256(2)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_f_invalid_max_reverts() public {
        // f(uint8): 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff -> FAILURE
        bytes memory callData = abi.encodePacked(
            Enums.f.selector,
            uint256(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }
}
