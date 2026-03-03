// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TryCatchMalformedPanic.sol";

contract TryCatchMalformedPanicTest {
    function test_TryCatchMalformedPanic() public {
        TryCatchMalformedPanic c = new TryCatchMalformedPanic();

        // a() and b(): too few bytes to decode Panic, fall into catch {}
        assert(c.a() == 0);
        assert(c.b() == 0);

        // c() and d(): sufficient bytes to decode Panic(0x43)
        assert(c.c() == 0x43);
        assert(c.d() == 0x43);
    }
}
