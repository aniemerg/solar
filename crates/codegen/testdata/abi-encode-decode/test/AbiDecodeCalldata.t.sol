// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AbiDecodeCalldata.sol";

contract AbiDecodeCalldataTest {
    AbiDecodeCalldata c;

    function setUp() public {
        c = new AbiDecodeCalldata();
    }

    function test_AbiDecodeCalldata() public view {
        bytes memory payload = abi.encode(uint256(0x21), bytes("abcdefg"));
        (uint256 n, bytes memory s) = c.f(payload);
        assert(n == 0x21);
        assert(keccak256(s) == keccak256(bytes("abcdefg")));
    }
}
