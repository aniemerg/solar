// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AbiEncodeCallUintBytes.sol";

contract AbiEncodeCallUintBytesTest {
    AbiEncodeCallUintBytes c;

    function setUp() public {
        c = new AbiEncodeCallUintBytes();
    }

    function test_AbiEncodeCallUintBytes_f() public {
        bytes memory result = c.f();
        // Expected: 0x60, then three 32-byte words:
        // 0x1234000...0, 0x6162000...0 ("ab"), 0x1234000...0
        assert(result.length == 0x60);
        bytes32 w0;
        bytes32 w1;
        bytes32 w2;
        assembly {
            w0 := mload(add(result, 32))
            w1 := mload(add(result, 64))
            w2 := mload(add(result, 96))
        }
        assert(w0 == bytes32(hex"1234000000000000000000000000000000000000000000000000000000000000"));
        assert(w1 == bytes32(hex"6162000000000000000000000000000000000000000000000000000000000000"));
        assert(w2 == bytes32(hex"1234000000000000000000000000000000000000000000000000000000000000"));
    }

    function test_AbiEncodeCallUintBytes_f2() public {
        bytes memory result = c.f2();
        // Expected: 0x40, two 32-byte words: 0x1234 (right-padded as uint16), 0x1234
        assert(result.length == 0x40);
        bytes32 w0;
        bytes32 w1;
        assembly {
            w0 := mload(add(result, 32))
            w1 := mload(add(result, 64))
        }
        assert(w0 == bytes32(uint256(0x1234)));
        assert(w1 == bytes32(uint256(0x1234)));
    }
}
