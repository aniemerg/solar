// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TryCatchMalformedPanic4.sol";

contract TryCatchMalformedPanic4Test {
    function test_TryCatchMalformedPanic4() public {
        TryCatchMalformedPanic4 c = new TryCatchMalformedPanic4();

        // a() and b(): too few bytes for Panic, fall into catch {}
        assert(c.a() == 0);
        assert(c.b() == 0);

        // c() and d(): sufficient bytes to decode Panic(0x43)
        assert(c.c() == 0x43);
        assert(c.d() == 0x43);
    }
}
