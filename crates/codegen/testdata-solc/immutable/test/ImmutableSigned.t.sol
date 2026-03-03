// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ImmutableSigned.sol";

contract ImmutableSignedTest {
    function test_ImmutableSigned() public {
        ImmutableSigned c = new ImmutableSigned();
        (bytes32 x, bytes32 y) = c.viaasm();
        // int8(-2) sign-extended to 32 bytes = 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe
        assert(x == 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe);
        // bytes2("ab") = 0x6162, left-aligned in bytes32
        assert(y == 0x6162000000000000000000000000000000000000000000000000000000000000);
    }
}
