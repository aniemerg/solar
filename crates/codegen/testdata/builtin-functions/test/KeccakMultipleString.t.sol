// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/KeccakMultipleString.sol";

contract KeccakMultipleStringTest {
    function test_KeccakMultipleString() public {
        KeccakMultipleString c = new KeccakMultipleString();
        assert(
            c.foo() ==
                0x41b1a0649752af1b28b3dc29a1556eee781e4a4c3a1f7f53f90fa834de098c4d
        );
        assert(
            c.bar(0xa, 0xc) ==
                0x6990f36476dc412b1c4baa48e2d9f4aa4bb313f61fda367c8fdbbb2232dc6146
        );
    }
}
