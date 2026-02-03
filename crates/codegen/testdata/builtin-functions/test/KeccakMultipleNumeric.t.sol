// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/KeccakMultipleNumeric.sol";

contract KeccakMultipleNumericTest {
    function test_KeccakMultipleNumeric() public {
        KeccakMultipleNumeric c = new KeccakMultipleNumeric();
        assert(
            c.foo(0xa, 0xc) ==
                0x88acd45f75907e7c560318bc1a5249850a0999c4896717b1167d05d116e6dbad
        );
    }
}
