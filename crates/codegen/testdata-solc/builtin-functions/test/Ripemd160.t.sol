// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Ripemd160.sol";

contract Ripemd160Test {
    function test_Ripemd160() public {
        Ripemd160 c = new Ripemd160();
        assert(c.f(4) == 0x1b0f3c404d12075c68c938f9f60ebea4f74941a0000000000000000000000000);
        assert(c.f(5) == 0xee54aa84fc32d8fed5a5fe160442ae84626829d9000000000000000000000000);
        assert(c.f(-1) == 0x1cf4e77f5966e13e109703cd8a0df7ceda7f3dc3000000000000000000000000);
    }
}
