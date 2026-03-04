// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/Basic.sol";

contract BasicTest is Test {
    Basic c;

    function setUp() public {
        c = new Basic();
        vm.deal(address(this), 2 ether);
    }

    function test_Basic_d() public {
        c.d();
    }

    function test_Basic_e_wei() public {
        assert(c.e{value: 1}() == 1);
    }

    function test_Basic_e_ether() public {
        assert(c.e{value: 1 ether}() == 1000000000000000000);
    }

    function test_Basic_f() public {
        (uint a, uint b) = c.f(3);
        assert(a == 3 && b == 3);
    }

    function test_Basic_g() public {
        (uint a, uint b) = c.g();
        assert(a == 2 && b == 3);
    }

    function test_Basic_h() public {
        // h(1, -2) -> 3; -2 as uint256 wraps around, 1 - uint256(-2) = 3 unchecked
        assert(c.h(1, uint256(int256(-2))) == 3);
    }

    function test_Basic_i() public {
        assert(c.i(true) == false);
    }

    function test_Basic_j() public {
        (bytes32 a, bytes32 b) = c.j(bytes32(uint256(0x10001)));
        assert(a == bytes32(uint256(0x10001)) && b == bytes32(uint256(0x10001)));
    }

    function test_Basic_l() public {
        assert(c.l(99) == 693);
    }
}
