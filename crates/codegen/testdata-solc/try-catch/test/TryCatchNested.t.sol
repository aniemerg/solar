// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TryCatchNested.sol";

contract TryCatchNestedTest {
    function test_TryCatchNested() public {
        TryCatchNested c = new TryCatchNested();

        // f(true, true) -> 1, 2, "success"
        (uint x, uint y, bytes memory txt) = c.f(true, true);
        assert(x == 1);
        assert(y == 2);
        assert(keccak256(txt) == keccak256(bytes("success")));

        // f(true, false) -> 12, 0, "failure"
        (x, y, txt) = c.f(true, false);
        assert(x == 12);
        assert(y == 0);
        assert(keccak256(txt) == keccak256(bytes("failure")));

        // f(false, true) -> 99, 0, "failure"
        (x, y, txt) = c.f(false, true);
        assert(x == 99);
        assert(y == 0);
        assert(keccak256(txt) == keccak256(bytes("failure")));

        // f(false, false) -> 99, 0, "failure"
        (x, y, txt) = c.f(false, false);
        assert(x == 99);
        assert(y == 0);
        assert(keccak256(txt) == keccak256(bytes("failure")));
    }
}
