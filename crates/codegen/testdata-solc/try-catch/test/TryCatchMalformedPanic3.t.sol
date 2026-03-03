// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TryCatchMalformedPanic3.sol";

contract TryCatchMalformedPanic3Test {
    function test_a() public {
        TryCatchMalformedPanic3 c = new TryCatchMalformedPanic3();
        // No low-level catch: malformed panic is re-thrown
        (bool ok,) = address(c).call(abi.encodeWithSignature("a()"));
        assert(!ok);
    }

    function test_b() public {
        TryCatchMalformedPanic3 c = new TryCatchMalformedPanic3();
        // No low-level catch: malformed panic is re-thrown
        (bool ok,) = address(c).call(abi.encodeWithSignature("b()"));
        assert(!ok);
    }

    function test_c() public {
        TryCatchMalformedPanic3 c = new TryCatchMalformedPanic3();
        assert(c.c() == 0x43);
    }

    function test_d() public {
        TryCatchMalformedPanic3 c = new TryCatchMalformedPanic3();
        assert(c.d() == 0x43);
    }
}
