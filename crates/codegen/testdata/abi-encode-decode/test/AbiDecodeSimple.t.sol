// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AbiDecodeSimple.sol";

contract AbiDecodeSimpleTest {
    AbiDecodeSimple c;

    function setUp() public {
        c = new AbiDecodeSimple();
    }

    function test_AbiDecodeSimple() public view {
        bytes memory payload = abi.encode(uint256(0x21), bytes("abcdefg"));
        (uint256 n, bytes memory s) = c.f(payload);
        assert(n == 0x21);
        assert(keccak256(s) == keccak256(bytes("abcdefg")));
    }
}
