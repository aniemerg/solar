// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/KeccakMultiple.sol";

contract KeccakMultipleTest {
    function test_KeccakMultiple() public {
        KeccakMultiple c = new KeccakMultiple();
        assert(
            c.foo(0xa, 0xc, 0xd) ==
                0xbc740a98aae5923e8f04c9aa798c9ee82f69e319997699f2782c40828db9fd81
        );
    }
}
