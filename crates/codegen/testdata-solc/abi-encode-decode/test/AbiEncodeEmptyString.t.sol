// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AbiEncodeEmptyString.sol";

contract AbiEncodeEmptyStringTest {
    AbiEncodeEmptyString c;

    function setUp() public {
        c = new AbiEncodeEmptyString();
    }

    function test_AbiEncodeEmptyString() public view {
        (bytes memory encoded, bytes memory packed) = c.f();
        // abi.encode("") = (offset=32, length=0) -> 64 bytes total
        assert(encoded.length == 64);
        // abi.encodePacked("") = empty
        assert(packed.length == 0);
        // Verify encoded contents: offset=32, length=0
        bytes32 w0;
        bytes32 w1;
        assembly {
            w0 := mload(add(encoded, 32))
            w1 := mload(add(encoded, 64))
        }
        assert(w0 == bytes32(uint256(32)));
        assert(w1 == bytes32(uint256(0)));
    }
}
