// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Base64.sol";

// Test cases derived from Base64 specification: RFC4648
// https://datatracker.ietf.org/doc/html/rfc4648#section-10
contract Base64Test {
    Base64 c;

    function setUp() public {
        c = new Base64();
    }

    function test_encode_inline_asm_empty() public view {
        assert(keccak256(bytes(c.encode_inline_asm(""))) == keccak256(bytes("")));
    }

    function test_encode_inline_asm_f() public view {
        assert(keccak256(bytes(c.encode_inline_asm("f"))) == keccak256(bytes("Zg==")));
    }

    function test_encode_inline_asm_fo() public view {
        assert(keccak256(bytes(c.encode_inline_asm("fo"))) == keccak256(bytes("Zm8=")));
    }

    function test_encode_inline_asm_foo() public view {
        assert(keccak256(bytes(c.encode_inline_asm("foo"))) == keccak256(bytes("Zm9v")));
    }

    function test_encode_inline_asm_foob() public view {
        assert(keccak256(bytes(c.encode_inline_asm("foob"))) == keccak256(bytes("Zm9vYg==")));
    }

    function test_encode_inline_asm_fooba() public view {
        assert(keccak256(bytes(c.encode_inline_asm("fooba"))) == keccak256(bytes("Zm9vYmE=")));
    }

    function test_encode_inline_asm_foobar() public view {
        assert(keccak256(bytes(c.encode_inline_asm("foobar"))) == keccak256(bytes("Zm9vYmFy")));
    }

    function test_encode_no_asm_empty() public view {
        assert(keccak256(bytes(c.encode_no_asm(""))) == keccak256(bytes("")));
    }

    function test_encode_no_asm_f() public view {
        assert(keccak256(bytes(c.encode_no_asm("f"))) == keccak256(bytes("Zg==")));
    }

    function test_encode_no_asm_fo() public view {
        assert(keccak256(bytes(c.encode_no_asm("fo"))) == keccak256(bytes("Zm8=")));
    }

    function test_encode_no_asm_foo() public view {
        assert(keccak256(bytes(c.encode_no_asm("foo"))) == keccak256(bytes("Zm9v")));
    }

    function test_encode_no_asm_foob() public view {
        assert(keccak256(bytes(c.encode_no_asm("foob"))) == keccak256(bytes("Zm9vYg==")));
    }

    function test_encode_no_asm_fooba() public view {
        assert(keccak256(bytes(c.encode_no_asm("fooba"))) == keccak256(bytes("Zm9vYmE=")));
    }

    function test_encode_no_asm_foobar() public view {
        assert(keccak256(bytes(c.encode_no_asm("foobar"))) == keccak256(bytes("Zm9vYmFy")));
    }
}
