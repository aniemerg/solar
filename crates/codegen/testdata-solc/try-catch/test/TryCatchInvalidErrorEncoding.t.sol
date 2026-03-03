// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TryCatchInvalidErrorEncoding.sol";

contract TryCatchInvalidErrorEncodingTest {
    function test_f1() public {
        TryCatchInvalidErrorEncoding c = new TryCatchInvalidErrorEncoding();
        assert(c.f1() == 2);
    }

    function test_f1a() public {
        TryCatchInvalidErrorEncoding c = new TryCatchInvalidErrorEncoding();
        assert(c.f1a() == 2);
    }

    function test_f1b() public {
        TryCatchInvalidErrorEncoding c = new TryCatchInvalidErrorEncoding();
        // f1b has no low-level catch, so it re-throws
        (bool ok,) = address(c).call(abi.encodeWithSignature("f1b()"));
        assert(!ok);
    }

    function test_f1c() public {
        TryCatchInvalidErrorEncoding c = new TryCatchInvalidErrorEncoding();
        assert(c.f1c() == 2);
    }

    function test_f2() public {
        TryCatchInvalidErrorEncoding c = new TryCatchInvalidErrorEncoding();
        assert(c.f2() == 2);
    }

    function test_f2a() public {
        TryCatchInvalidErrorEncoding c = new TryCatchInvalidErrorEncoding();
        assert(c.f2a() == 2);
    }

    function test_f2b() public {
        TryCatchInvalidErrorEncoding c = new TryCatchInvalidErrorEncoding();
        // f2b has no low-level catch, so it re-throws
        (bool ok,) = address(c).call(abi.encodeWithSignature("f2b()"));
        assert(!ok);
    }

    function test_f2c() public {
        TryCatchInvalidErrorEncoding c = new TryCatchInvalidErrorEncoding();
        assert(c.f2c() == 1);
    }

    function test_f3() public {
        TryCatchInvalidErrorEncoding c = new TryCatchInvalidErrorEncoding();
        assert(c.f3() == 2);
    }

    function test_f3a() public {
        TryCatchInvalidErrorEncoding c = new TryCatchInvalidErrorEncoding();
        assert(c.f3a() == 2);
    }

    function test_f3b() public {
        TryCatchInvalidErrorEncoding c = new TryCatchInvalidErrorEncoding();
        // f3b has no low-level catch, so it re-throws
        (bool ok,) = address(c).call(abi.encodeWithSignature("f3b()"));
        assert(!ok);
    }

    function test_f3c() public {
        TryCatchInvalidErrorEncoding c = new TryCatchInvalidErrorEncoding();
        assert(c.f3c() == 1);
    }

    function test_f4() public {
        TryCatchInvalidErrorEncoding c = new TryCatchInvalidErrorEncoding();
        assert(c.f4() == 1);
    }

    function test_f4a() public {
        TryCatchInvalidErrorEncoding c = new TryCatchInvalidErrorEncoding();
        assert(c.f4a() == 1);
    }

    function test_f4b() public {
        TryCatchInvalidErrorEncoding c = new TryCatchInvalidErrorEncoding();
        assert(c.f4b() == 1);
    }

    function test_f4c() public {
        TryCatchInvalidErrorEncoding c = new TryCatchInvalidErrorEncoding();
        assert(c.f4c() == 1);
    }
}
