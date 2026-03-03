// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EmptyStorageString.sol";

contract EmptyStorageStringTest is Test {
    EmptyStorageString c;

    function setUp() public {
        c = new EmptyStorageString();
    }

    function test_f() public view {
        assert(bytes(c.f()).length == 0);
    }

    function test_g() public view {
        (string memory a, string memory b) = c.g();
        assert(bytes(a).length == 0);
        assert(bytes(b).length == 0);
    }

    function test_h() public view {
        (string memory a, string memory b) = c.h();
        assert(bytes(a).length == 0);
        assert(keccak256(bytes(b)) == keccak256(bytes("This is a non empty string")));
    }

    function test_i() public view {
        (string memory a, string memory b) = c.i();
        assert(keccak256(bytes(a)) == keccak256(bytes("This is a non empty string")));
        assert(bytes(b).length == 0);
    }

    function test_j() public view {
        string memory result = c.j("");
        assert(bytes(result).length == 0);
    }

    function test_k() public {
        assert(bytes(c.k()).length == 0);
    }

    function test_l() public view {
        bytes memory encoded = c.l("");
        // abi.encode("") -> offset 0x20, length 0
        assert(encoded.length == 64);
    }

    function test_m() public view {
        // m() returns abi.encode(emptyString) cast to string
        // abi.encode("") is 64 bytes, as string it has length 64
        bytes memory result = bytes(c.m());
        assert(result.length == 64);
    }

    function test_n() public {
        vm.expectRevert(abi.encodeWithSelector(EmptyStorageString.EmptyError.selector, ""));
        c.n();
    }

    function test_o() public {
        c.o();
    }

    function test_p() public {
        c.p();
    }

    function test_q() public view {
        assert(c.q().length == 0);
    }

    function test_r() public {
        // r() sets emptyBytes = abi.encode("") and returns it
        bytes memory result = c.r();
        assert(result.length == 64);
    }

    function test_s() public {
        // s() sets emptyBytes = abi.encode(uninitializedString) and returns it
        bytes memory result = c.s();
        assert(result.length == 64);
    }

    function test_set_get() public {
        c.set("");
        assert(bytes(c.get()).length == 0);
    }
}
