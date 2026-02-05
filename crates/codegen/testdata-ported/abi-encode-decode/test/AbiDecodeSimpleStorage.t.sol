// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AbiDecodeSimpleStorage.sol";

contract AbiDecodeSimpleStorageTest {
    AbiDecodeSimpleStorage c;

    function setUp() public {
        c = new AbiDecodeSimpleStorage();
    }

    function test_AbiDecodeSimpleStorage() public {
        bytes memory payload = abi.encode(uint256(0x21), bytes("abcdefg"));
        (uint256 n, bytes memory s) = c.f(payload);
        assert(n == 0x21);
        assert(keccak256(s) == keccak256(bytes("abcdefg")));
    }
}
