// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/StructValidation.sol";

contract StructValidationTest is Test {
    StructValidation c;

    function setUp() public {
        c = new StructValidation();
    }

    function test_f_valid() public {
        // f((int16,uint8,bytes2)): 0xffffff...ff01, 0xff, "ab" -> same
        // 0xffffff...ff01 as int16 = sign-extended -255 (0xff01)
        StructValidation.S memory s;
        s.a = int16(-255); // 0xff01 sign-extended
        s.b = 0xff;
        s.c = bytes2("ab");
        (uint a, uint b, uint cc) = c.f(s);
        assertEq(int16(int256(a)), s.a);
        assertEq(b, 0xff);
        assertEq(cc, uint256(bytes32("ab")));
    }

    function test_f_invalid_a_reverts() public {
        // f((int16,uint8,bytes2)): 0xff010, 0xff, "ab" -> FAILURE (invalid int16)
        bytes memory callData = abi.encodePacked(
            StructValidation.f.selector,
            uint256(0xff010),    // invalid int16 (too wide)
            uint256(0xff),
            bytes32("ab")
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_f_invalid_b_reverts() public {
        // f((int16,uint8,bytes2)): valid_a, 0xff0002, "ab" -> FAILURE (invalid uint8)
        bytes memory callData = abi.encodePacked(
            StructValidation.f.selector,
            uint256(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff01),
            uint256(0xff0002),   // invalid uint8
            bytes32("ab")
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }

    function test_f_invalid_c_reverts() public {
        // f((int16,uint8,bytes2)): valid_a, 0xff, "abcd" -> FAILURE (invalid bytes2)
        bytes memory callData = abi.encodePacked(
            StructValidation.f.selector,
            uint256(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff01),
            uint256(0xff),
            bytes32("abcd")   // invalid bytes2 (has data after first 2 bytes)
        );
        (bool success,) = address(c).call(callData);
        assertFalse(success);
    }
}
