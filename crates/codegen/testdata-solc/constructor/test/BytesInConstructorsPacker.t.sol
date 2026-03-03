// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/BytesInConstructorsPacker.sol";

contract BytesInConstructorsPackerTest {
    function test_BytesInConstructorsPacker() public {
        Creator c = new Creator();
        bytes memory s = new bytes(78);
        // fill with a-z repeated
        for (uint i = 0; i < 78; i++) {
            s[i] = bytes1(uint8(97 + (i % 26)));
        }
        // f(7, s): expect r=7, ch=s[7]='h' (index 7 in a-z is 'h')
        (uint r, bytes1 ch) = c.f(7, s);
        assert(r == 7);
        assert(ch == bytes1("h"));
    }
}
