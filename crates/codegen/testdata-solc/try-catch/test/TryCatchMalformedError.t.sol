// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TryCatchMalformedError.sol";

contract TryCatchMalformedErrorTest {
    function test_TryCatchMalformedError() public {
        TryCatchMalformedError c = new TryCatchMalformedError();

        // a(), b(), b2(), b3() all fall into catch {} with assert(true) - no return value (returns 0)
        assert(c.a() == 0);
        assert(c.b() == 0);
        assert(c.b2() == 0);
        // b3 returns string memory, empty string
        string memory s3 = c.b3();
        assert(bytes(s3).length == 0);

        // c() and d() have sufficient bytes to parse Error(string) with "abcdefg"
        string memory sc = c.c();
        assert(keccak256(bytes(sc)) == keccak256(bytes("abcdefg")));

        string memory sd = c.d();
        assert(keccak256(bytes(sd)) == keccak256(bytes("abcdefg")));
    }
}
