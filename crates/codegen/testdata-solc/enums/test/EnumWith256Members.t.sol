// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EnumWith256Members.sol";

contract EnumWith256MembersTest is Test {
    EnumWith256Members c;

    function setUp() public {
        c = new EnumWith256Members();
    }

    function test_EnumWith256Members_getMinMax() public view {
        (E a, E b) = c.getMinMax();
        assert(uint8(a) == 0);
        assert(uint8(b) == 255);
    }

    function test_EnumWith256Members_intToEnum() public view {
        assert(uint8(c.intToEnum(0)) == 0);
        assert(uint8(c.intToEnum(255)) == 255);
    }

    function test_EnumWith256Members_enumToInt() public view {
        assert(c.enumToInt(E.E000) == 0);
        assert(c.enumToInt(E.E255) == 255);
    }

    function test_EnumWith256Members_enumToInt_overflow() public {
        // Passing uint8 value 256 should revert (out of range)
        (bool ok,) = address(c).call(abi.encodeWithSelector(EnumWith256Members.enumToInt.selector, uint256(256)));
        assert(!ok);
    }

    function test_EnumWith256Members_decodeEnum() public view {
        assert(uint8(c.decodeEnum(abi.encode(uint256(0)))) == 0);
        assert(uint8(c.decodeEnum(abi.encode(uint256(255)))) == 255);
    }

    function test_EnumWith256Members_decodeEnum_failure() public {
        vm.expectRevert();
        c.decodeEnum(abi.encode(uint256(256)));
    }
}
