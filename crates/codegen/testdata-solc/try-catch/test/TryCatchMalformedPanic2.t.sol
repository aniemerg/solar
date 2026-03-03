// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TryCatchMalformedPanic2.sol";

contract TryCatchMalformedPanic2Test {
    function test_a() public {
        TryCatchMalformedPanic2 c = new TryCatchMalformedPanic2();
        // No low-level catch: malformed panic is re-thrown
        (bool ok,) = address(c).call(abi.encodeWithSignature("a()"));
        assert(!ok);
    }

    function test_b() public {
        TryCatchMalformedPanic2 c = new TryCatchMalformedPanic2();
        // No low-level catch: malformed panic is re-thrown
        (bool ok,) = address(c).call(abi.encodeWithSignature("b()"));
        assert(!ok);
    }

    function test_c() public {
        TryCatchMalformedPanic2 c = new TryCatchMalformedPanic2();
        assert(c.c() == 0x43);
    }

    function test_d() public {
        TryCatchMalformedPanic2 c = new TryCatchMalformedPanic2();
        assert(c.d() == 0x43);
    }
}
